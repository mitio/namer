# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Namer::Application.config.secret_token = ENV['SECRET_TOKEN'] || '01ace7ce9c50db09598491a02d78d3df791237cd6c668'
