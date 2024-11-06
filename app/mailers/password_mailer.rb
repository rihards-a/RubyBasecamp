class PasswordMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    # using lobalID (open source project on github) token generator
    @token  = params[:user].signed_id(purpose: "password_reset", expires_in: 10.minutes) # signed_id to prevent tampering with the users global id
    mail to: params[:user].email
  end
end
