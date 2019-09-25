class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.newBooking.subject
  #
  def newBooking(booking, admins)
    @booking = booking

    admins.each do |admin|
      mail to: admin.email
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.statusChange.subject
  #
  def statusChange(booking)
    @booking = booking

    mail to: booking.user.email
  end
end
