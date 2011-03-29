Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '179591418728914', '[insert manually for now]'
  provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :twitter, 'Q7ewc5XJe2yWYt6VCueImA', '[insert manually for now]'
end
