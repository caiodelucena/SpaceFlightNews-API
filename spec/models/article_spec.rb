require 'rails_helper'

RSpec.describe Article, type: :model do
  subject {
    Article.new(title: 'Airbus Ventures leads Q-Ctrl’s $25 million quantum sensor funding round', newsSite: 'SpaceNews', featured: false, url: 'http://www.nasa.gov', imageUrl: 'https://www.nasa.gov', summary: 'NASA will provide coverage of the upcoming ...', publishedAt: '2021-11-30T20:59:00.000Z')
  }

  describe 'validations' do
    it 'is valid with all params' do
      expect(subject).to be_valid
    end

    it 'is not valid without some params' do
      article = Article.new(title: nil, summary: nil)
      expect(article).to_not be_valid
    end


    context 'when title is not unique' do
      before { FactoryBot.create(:article, title: 'Airbus Ventures leads Q-Ctrl’s $25 million quantum sensor funding round', newsSite: 'SpaceNews', featured: false)}
      it { expect(subject).to be_invalid }
    end

    context 'when title is unique' do
      before { FactoryBot.create(:article, title: 'Phasellus maximus elementum diam quis mollis.')}
      it { expect(subject).to be_valid }
    end

  end

end