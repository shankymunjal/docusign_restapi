require 'docusign_rest'

DocusignRest.configure do |config|
  config.username       = 'developer@seedhit.com'
  config.password       = 'ILoveHealthcare'
  config.integrator_key = 'wSEED-d3a15215-7073-409b-bbc2-557cb7f1349b'
  config.account_id     = '297790'
  #config.endpoint       = 'https://www.docusign.net/restapi'
  config.api_version    = 'v2'
end

