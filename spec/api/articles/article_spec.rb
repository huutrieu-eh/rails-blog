require 'rails_helper'

describe ArticleApi do
  let(:path) {"http://0.0.0.0:3000/api/v1/articles/"}
  let(:params) do
    {
      title: "Sidekiq",
      body: "Introduction to Sidekq API",
      status: "public"
    }
  end

  describe 'GET /articles/:id' do
    it 'not found' do
      get 'http://0.0.0.0:3000/api/v1/articles/1'
      expect(response.status).to eq 404
    end

    context 'success' do
      before do

      end

      it 'success' do
        article = Article.create(params)
        get "http://0.0.0.0:3000/api/v1/articles/#{article.id}"
        expect(response.status).to eq 200
        body = JSON.parse(response.body)
        expect(body["title"]).to eq "Sidekiq"
        expect(response.body).to match_response_schema('articles', strict: true)
      end
    end
  end

  describe 'POST /articles' do
    it 'success' do
      post 'http://0.0.0.0:3000/api/v1/articles', params: params
      expect(response.status).to eq 201
    end
  end

  describe 'PATCH /articles' do
    it 'success' do
      article = Article.create(params)
      patch "http://0.0.0.0:3000/api/v1/articles/#{article.id}", params: params
      expect(response.status).to eq 200
    end
  end

  describe 'DELETE /articles' do
    it 'success' do
      article = Article.create(params)
      delete "http://0.0.0.0:3000/api/v1/articles/#{article.id}"
      expect(response.status).to eq 200
      expect(Article.exists?(article.id)).to be false
    end
  end

end