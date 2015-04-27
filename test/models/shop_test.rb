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

  test "url should be present" do
    @shop.url = "     "
    assert_not @shop.valid?
    @shop.url = ""
    assert_not @shop.valid?
  end

  #test "create from session" do
  #  session = ShopifyAPI::Session.new("foo.myshopify.com", "faketoken")
  #  shop = Shop.find_or_create_from_api(session)
  #  assert shop.valid?
  #  assert_equal shop.url, session.url
  #end

end
