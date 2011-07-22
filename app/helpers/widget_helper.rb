module WidgetHelper
  def make_link_to_ceneo val
   data = Nokogiri::HTML(open('http://www.ceneo.pl/;004+s' + val))
          
   @prices = Array.new
   @in_shops = Array.new
   
   data.css('div.product big strong.price').each {|price| @prices << price.content}
   data.css('div.product big span').each {|shops| @in_shops << shops.content}
   link_to(@prices.blank? ? 'Ceneo' : 'od ' + @prices.first+' zł ' + @in_shops.first, 'http://www.ceneo.pl/;004+s' + val, :popup => true).html_safe
  end
  
  def make_link_to_gallery val
    val.blank? ? "-" : link_to('Galeria', chech_for_protocule(val), :popup => true)
  end
  
  def chech_for_protocule val
    (val.include?('http') or val.include?('https')) ? val : 'http://'+val
  end
  
  def compare_cards  cards_to_find
      @cards = Array.new
      @values = Array.new
      
      @values << [t("card_description.card_name"),
                  t("card_description.sku_number"),
                  t("card_description.process"),
                  t("card_description.ram"),
                  t("card_description.core_freq"),
                  t("card_description.mem_freq"),
                  t("card_description.stream"),
                  t("card_description.mem_bus"),
                  t("card_description.mem_type"),
                  t("card_description.mem_speed"),
                  t("card_description.cooling_type"),
                  t("card_description.cooling_height"),
                  t("card_description.aux_power"),
                  t("card_description.directx"),
                  t("card_description.opengl"),
                  t("card_description.vga"),
                  t("card_description.dvi"),
                  t("card_description.tv_out"),
                  t("card_description.hdmi"),
                  t("card_description.display_port"),
                  t("card_description.hdmi_ver"),
                  t("card_description.hdmi_mode"),
                  t("card_description.resolution"),
                  t("card_description.min_power"),
                  t("card_description.max_power"),
                  t("card_description.gallery"),
                  (t("card_description.ceneo") if I18n.locale == :pl),
                  t("card_description.like_this")]

      cards_to_find = cards_to_find.uniq

      cards_to_find.each { |grup|
        @cards << Serie.find(grup[0]).cards.find(grup[1])
      }

      @values_unsorted = Array.new

      @cards.each do |card|
        # @values << Array.new(card.name, card.sku, card.process)
      @values_unsorted << [card.name, 
      	 card.sku, 
      	 card.process, 
      	 card.memory_options,
      	 card.core_frequency,
      	 card.memory_frequency,
      	 card.unified_shader_pipelines,
      	 card.memory_bus,
      	 card.memory_type,
      	 card.peak_memory_bandwidth,
      	 card.standard_cooling,
      	 card.standard_slot_solution,
      	 card.external_power_need,
      	 card.directX,
      	 card.openGL,
      	 card.vga,
      	 card.dvi_i,
      	 card.tv_out,
      	 card.hdmi,
      	 card.display_port,
      	 card.hdmi_compliance,
      	 card.hdmi_modes,
      	 card.graphics_resolution,
      	 card.min_power,
      	 card.max_power,
      	 card.link_to_gallery,
      	 (card.sku.split('-').join('~~F') if I18n.locale == :pl),
      	 "<iframe src='http://www.facebook.com/plugins/like.php?locale=pl_PL&href=http%3A%2F%2Fhollow-galaxy-24.heroku.com%2Fdescribe%2F#{card.serie.id}%2F#{card.id}%2F&amp;layout=button_count&amp;show_faces=true&amp;width=450&amp;action=like&amp;font=verdana&amp;colorscheme=light&amp;height=21' scrolling='no' frameborder='0' style='border:none; overflow:hidden; width:100px; height:20px;' allowTransparency='true'></iframe>"
      	 ]
      end

      @values = @values + @values_unsorted.sort.reverse

      @values = @values.transpose

      @find_in_rows = [4, 5, 6, 13, 14]

      @max_values = find_ekstreams @values, @find_in_rows
  end
  
  def make_dialog_javascript_for cards
    array = Array.new
    array << "jQuery.fx.speeds._default = 1000;"    
    cards.each do |card|
      array << "jQuery('#dialog#{card.id}').dialog({autoOpen: false, position: ['center', 70], show: 'drop', hide: 'explode'});"
      array << "jQuery('#card#{card.id}').click(function () { jQuery('#dialog#{card.id}').dialog('open') })"
    end

    array.join("\n")
  end
  
  def make_dialog_content_for cards
    array = Array.new

    cards.each do |card|
      array << "<div style='display: none' id='dialog#{card.id}' title='#{card.name}'>#{card.opinions.find_by_language(I18n.locale.to_s).description}</div>"
    end

    array.join(' ')
  end
  
  def make_dialog_for_cards cards
    array = Array.new

    cards.each do |card|
      array << "<div style='display: none' id='dialog#{card.id}' title='#{card.name}'>#{card.opinions.find_by_language(I18n.locale.to_s).description}</div>"
    end
    
    array << "<script type='text/javascript'>"
    array << "jQuery(document).ready(function () {"
    array << "jQuery.fx.speeds._default = 1000;"    
    cards.each do |card|
      array << "jQuery('#dialog#{card.id}').dialog({autoOpen: false, position: ['center', 70], show: 'puff', hide: 'explode'});"
      array << "jQuery('#card#{card.id}').click(function () { jQuery('#dialog#{card.id}').dialog('open') })"
    end
    array << "});"
    array << "</script>"
    
    array.join("\n")
  end
  
  def update_selects_to cards
      array = Array.new 
      array << "<script type='text/javascript'>"
      (1..cards.count).to_a.each do |number|
        array << "jQuery('#serie_#{number}_card').val(#{cards[number-1].serie.id});"
        
      end
      
      array << "function update_me() { "
      (1..cards.count).to_a.each do |number|
        array << "jQuery('#card_serie_selector_#{number}').val(#{cards[number-1].id});"
      end
      array << "};"
      array << '</script>'
      array.join("\n")
  end

  private
  def find_ekstreams matrix, find_in_rows
    max_values = Array.new
    
    matrix.each_with_index do |row, row_index|  
        if find_in_rows.include? row_index
          max_values << row.map {|e| e.to_f} .max
        end
    end
    
    max_values
  end
end
