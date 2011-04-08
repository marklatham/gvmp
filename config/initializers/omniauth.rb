Rails.application.config.middleware.use OmniAuth::Builder do
  
  facebook_secret = Authentication.where("user_id = ? and provider = ?", -1, "facebook").first.uid
  provider :facebook, '179591418728914', facebook_secret, {:scope => 'offline_access, email'} # user_education_history, 
  
  linked_in_secret = Authentication.where("user_id = ? and provider = ?", -1, "linked_in").first.uid
  provider :linked_in, '7nDh7oX2EyciTyguIrLvoaU2ASKLK5gjkxC179piy40eiRK7iHRq-TOdu1vBIXnz', linked_in_secret
  
  twitter_secret = Authentication.where("user_id = ? and provider = ?", -1, "twitter").first.uid
  provider :twitter, 'Q7ewc5XJe2yWYt6VCueImA', twitter_secret
  
end
