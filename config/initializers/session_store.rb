# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kartoporownywach_session',
  :secret      => 'd4b577697a6fb10feb9050f947ade2164587f065b4493e4f12532f8aaea13adcd66dd5fc3cffd9702f3ca22f82280f6f5fb0182d9b101e7fbfed23edc20aa835'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
