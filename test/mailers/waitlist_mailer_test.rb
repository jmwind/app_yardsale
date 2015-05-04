require 'test_helper'

class WaitlistMailerTest < ActionMailer::TestCase
  test "buyer_added" do
    mail = WaitlistMailer.buyer_added
    assert_equal "Buyer added", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "product_back_in_inventory" do
    mail = WaitlistMailer.product_back_in_inventory
    assert_equal "Product back in inventory", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "product_sold" do
    mail = WaitlistMailer.product_sold
    assert_equal "Product sold", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
