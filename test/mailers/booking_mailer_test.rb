require 'test_helper'

class BookingMailerTest < ActionMailer::TestCase
  test "newBooking" do
    mail = BookingMailer.newBooking
    assert_equal "Newbooking", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "statusChange" do
    mail = BookingMailer.statusChange
    assert_equal "Statuschange", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
