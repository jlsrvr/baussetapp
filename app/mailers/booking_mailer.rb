class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.newBooking.subject
  #
  def newBooking
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.statusChange.subject
  #
  def statusChange
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
