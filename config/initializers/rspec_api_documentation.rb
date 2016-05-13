# Values listed are the default values
RspecApiDocumentation.configure do |config|
  # Change how the post body is formatted by default, you can still override by `raw_post`
  # Can be :json, :xml, or a proc that will be passed the params
  config.request_body_formatter = :json
end
