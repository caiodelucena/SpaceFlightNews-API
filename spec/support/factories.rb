require 'factory_bot_rails'

FactoryBot.define do

  factory :article do 
    title { 'Airbus Ventures leads Q-Ctrl’s $25 million quantum sensor funding round' }
    newsSite { 'SpaceNews' }
    featured { false }
  end

end