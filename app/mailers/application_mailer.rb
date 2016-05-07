class ApplicationMailer < ActionMailer::Base
  default from: 'Blog Jsonapi Base64 <support@blog-jsonapi-base64.com>'
  layout 'mailer'

  include Roadie::Rails::Automatic
end
