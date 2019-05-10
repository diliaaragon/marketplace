class UserMailer < ApplicationMailer
  def product_publish(product)
    @product = product

    User.all.each do |user|
      mail(to: user.email, subject:"New product in shoppy marketplace")
    end
  end
end
