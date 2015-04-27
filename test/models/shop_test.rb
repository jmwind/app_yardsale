require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @shop = Shop.new(
              url: "shop.myshopify.com",
              shop_id: "987654321",
              email: "user@example.com",
              name: "example_user",
              status: "active",
              owner: "foobar"
              )
  end

  test "should be valid" do
    assert @shop.valid?
  end

  test "name should be present" do
    @shop.url = "     "
    assert_not @shop.valid?
  end

  test "email should be present" do
    @shop.shop_id = "     "
    assert_not @shop.valid?
  end

end
