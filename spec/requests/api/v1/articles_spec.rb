require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET index' do
    context 'when there are articles' do
      before do
        FactoryBot.create(:article, title: 'Airbus Ventures leads Q-Ctrl’s $25 million quantum sensor funding round', newsSite: 'SpaceNews', featured: false, url: 'http://www.nasa.gov', imageUrl: 'https://www.nasa.gov', summary: 'NASA will provide coverage of the upcoming ...', publishedAt: '2021-11-30T20:59:00.000Z')
        FactoryBot.create(:article, title: 'NASA calls off spacewalk due to possible risk of space debris', newsSite: 'SpaceNews', featured: false, url: 'http://www.nasa.gov', imageUrl: 'https://www.nasa.gov', summary: 'NASA will provide coverage of the upcoming ...', publishedAt: '2021-11-30T20:59:00.000Z')
      end

      it 'returns 2 items' do
        get '/api/v1/articles'

        expect(JSON.parse(response.body).count).to eq(2)
      end

      it 'returns the correct HTTP status' do
        get '/api/v1/articles'

        expect(response).to have_http_status(:ok)
      end

      it 'returns the correct content_type' do
        get '/api/v1/articles'

        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'GET show' do
    before do
      @article_show = FactoryBot.create(:article, title: 'Airbus Ventures leads Q-Ctrl’s $25 million quantum sensor funding round', newsSite: 'SpaceNews', featured: false, url: 'http://www.nasa.gov', imageUrl: 'https://www.nasa.gov', summary: 'NASA will provide coverage of the upcoming ...', publishedAt: '2021-11-30T20:59:00.000Z')
    end

    it 'renders a successful response' do
      get "/api/v1/articles/#{@article_show.id}"

      expect(response).to be_successful
    end
  end

  describe 'POST create' do
    it 'creates a article' do
      expect do
        post '/api/v1/articles', params: {
          article: FactoryBot.attributes_for(:article)
        }
      end.to change(Article, :count).by(1)
    end

    it 'returns the correct HTTP status' do
      post '/api/v1/articles', params: {
        article: FactoryBot.attributes_for(:article)
      }

      expect(response).to have_http_status(:created)
    end

    it 'returns the correct content_type' do
      post '/api/v1/articles', params: {
        article: FactoryBot.attributes_for(:article)
      }

      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'PATCH update' do
    context 'with valid parameters' do
      before do
        @article_update = FactoryBot.create(:article, title: 'NASA calls off spacewalk due to possible risk of space debris', newsSite: 'SpaceNews', featured: false, url: 'http://www.nasa.gov', imageUrl: 'https://www.nasa.gov', summary: 'NASA will provide coverage of the upcoming ...', publishedAt: '2021-11-30T20:59:00.000Z')
      end

      it 'update a post' do
        patch "/api/v1/articles/#{@article_update.id}", params: {
          article: {
            title: 'Airbus Ventures leads Q-Ctrl’s $25 million quantum sensor funding round',
            featured: true
            }
          }
        @article_update.reload
        expect(@article_update[:title]).to eq(FactoryBot.attributes_for(:article)[:title]) 
      end

      it 'returns the correct HTTP status' do
        patch "/api/v1/articles/#{@article_update.id}", params: {
          article: FactoryBot.attributes_for(:article)
        }
        expect(response).to have_http_status(:accepted)
      end

      it 'returns the correct content_type' do
        patch "/api/v1/articles/#{@article_update.id}", 
        params: { article: FactoryBot.attributes_for(:article)}
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
      
    end

    context 'with invalid parameters' do
      before do
        @article_update_err = FactoryBot.create(:article, title: 'Airbus Ventures leads Q-Ctrl’s $25 million quantum sensor funding round', newsSite: 'SpaceNews', featured: false, url: 'http://www.nasa.gov', imageUrl: 'https://www.nasa.gov', summary: 'NASA will provide coverage of the upcoming ...', publishedAt: '2021-11-30T20:59:00.000Z')
      end
      it 'renders a JSON response with errors' do
        patch "/api/v1/articles/#{@article_update_err.id}",
          params: { article: { title: nil, featured: nil } }
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      @article_to_destroy = FactoryBot.create(:article, title: 'Airbus Ventures leads Q-Ctrl’s $25 million quantum sensor funding round', newsSite: 'SpaceNews', featured: false, url: 'http://www.nasa.gov', imageUrl: 'https://www.nasa.gov', summary: 'NASA will provide coverage of the upcoming ...', publishedAt: '2021-11-30T20:59:00.000Z')
    end
    
    it 'destroys the requested article' do
      expect do
        delete "/api/v1/articles/#{@article_to_destroy.id}"
      end.to change(Article, :count).by(-1)
    end
  end

end