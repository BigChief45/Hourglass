Rails.configuration.stripe = {
  :publishable_key => 'pk_test_98nOBzfSzVKJle81nXbnKnWX', # ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => 'sk_test_n03GL68hdKjKTo7SnPlTKSWz', # ENV['STRIPE_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
