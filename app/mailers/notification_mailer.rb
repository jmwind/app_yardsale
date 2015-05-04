class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.waitlist_mailer.buyer_added.subject
  #
  def buyer_added(shop, product, buyer)
    @shop = shop
    @product = product
    @buyer = buyer
    mail to: shop.email, subject: "[#{shop.name}] Buyer added to waitlist"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.waitlist_mailer.product_back_in_inventory.subject
  #
  def product_back_in_inventory
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.waitlist_mailer.product_sold.subject
  #
  def product_sold
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
