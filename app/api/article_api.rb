class ArticleApi < Grape::API
  version 'v1'
  format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers
  prefix :api

  resource :articles do
    desc 'Get list articles'
    get do
      @articles = Article.all
    end

    desc 'Create v1'
    params do
      requires :title, type: String
      requires :body, type: String
      requires :status, type: String
    end
    post do
      Article.create!(params)
    end

    route_param :id do
      before do
        @article = Article.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        error!('Article Not Found', 404)
      end

      desc 'Show a v1'
      get do
        @article
      end

      desc 'Update a v1'
      params do
        requires :id, type: Integer
        requires :title, type: String
        requires :body, type: String
        requires :status, type: String
      end
      patch do
        @article.update(params)
        @article
      end

      desc 'Delete a article'
      params do
        requires :id, type: Integer
      end
      delete do
        @article.destroy
      end
    end
  end
end

