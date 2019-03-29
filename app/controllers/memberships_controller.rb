class MembershipsController < ApplicationController

  before_action :authenticate_user!

  STRIPE_PREMIUM_PLAN_ID = 'plan_En06Djj9m8Xe2j'

  def new
  end

  def update
    customer = Stripe::Customer.create({
      source: params[:stripeToken],
      email: current_user.email,
      plan: STRIPE_PREMIUM_PLAN_ID,
    })

    current_user.premium = true
    current_user.stripe_customer_id = customer.id
    current_user.save

    redirect_to root_path
  end

end
