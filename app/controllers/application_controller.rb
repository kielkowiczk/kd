# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :check_location
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  protected
  def auth
    authenticate_or_request_with_http_basic do |user, pass|
      user == 'admin' && pass == 'pass123'
    end
  end
  
  def check_location
    #Or for IP use:
    # =>  request.env["HTTP_X_FORWARDED_FOR"]
    # =>  request.remote_addr
    # or detect language by request.env['Accept-Language']
    #
    # this is working solution, but it will be hard to debug app
    # @ip = request.env['HTTP_X_REAL_IP'] #|| request.remote_addr #this might be only for heroku!
    # #@request_headers = request.headers
    # @country = GeoIP.new(File.join(Rails.root, "lib/GeoIP.dat")).country(@ip)
    # 
    # unless @country[3].nil?
    #       I18n.locale = I18n.available_locales.include? @country[3].to_sym ? @country[3].to_sym : :en
    # end
    #
    
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    lang = extract_locale_from_accept_language_header 
    logger.debug "** found language: #{lang}"
    I18n.locale = (I18n.available_locales.include? lang) ? lang : :en 
    logger.debug "* Locale set to '#{I18n.locale}'"
  end
  
  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].nil? ? :en : request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first.to_sym
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
