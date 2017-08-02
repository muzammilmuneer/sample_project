class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'
  default template_path: -> (mailer) { "mailer/#{mailer.class.name.underscore}" }
end
