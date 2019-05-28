# frozen_string_literal: true

# Aplication Mailer.
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@shoppy.com'
  layout nil
end
