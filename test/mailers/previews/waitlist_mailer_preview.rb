# Preview all emails at http://localhost:3000/rails/mailers/waitlist_mailer
class WaitlistMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/waitlist_mailer/buyer_added
  def buyer_added
    WaitlistMailer.buyer_added
  end

  # Preview this email at http://localhost:3000/rails/mailers/waitlist_mailer/product_back_in_inventory
  def product_back_in_inventory
    WaitlistMailer.product_back_in_inventory
  end

  # Preview this email at http://localhost:3000/rails/mailers/waitlist_mailer/product_sold
  def product_sold
    WaitlistMailer.product_sold
  end

end
