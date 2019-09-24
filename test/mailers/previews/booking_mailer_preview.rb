# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/newBooking
  def newBooking
    BookingMailer.newBooking
  end

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/statusChange
  def statusChange
    BookingMailer.statusChange
  end

end
