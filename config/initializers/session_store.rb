# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lfee_session',
  :secret      => '64db466a247e2799e7af4b1031b8fbb110ad6e7eb93866a17ef27fbcd1329f2e1679f8e116302e38fa6e58f12daea6b2c2b88f152228cb573e5cc788182a04e0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
