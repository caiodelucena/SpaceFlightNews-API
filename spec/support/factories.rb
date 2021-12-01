require 'factory_bot_rails'

FactoryBot.define do

  factory :article do 
    title { 'Airbus Ventures leads Q-Ctrl’s $25 million quantum sensor funding round' }
    newsSite { 'SpaceNews' }
    featured { false }
    url { 'http://www.nasa.gov/press-release/nasa-tv-to-air-ixpe-prelaunch-activities-launch' }
    imageUrl { 'https://www.nasa.gov/sites/default/files/thumbnails/image/ixpe_009.jpeg?itok=ViPSTlwn' }
    summary {'NASA will provide coverage of the upcoming ...'}
    publishedAt { '2021-11-30T20:59:00.000Z' }

  end

end