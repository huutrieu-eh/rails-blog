class CommentApi < Grape::API
  version 'v1'
  format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers
  prefix :api

  resource :comments do
    desc 'Get list comments by article_id'
    params do
      requires :article_id, type: Integer
    end
    get do
      @article = Article.find(params[:article_id])
      @comments = @article.comments
      @comments
    end

    route_param :id do
      before do
        @comment = Comment.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        error!('Comment Not Found', 404)
      end

      desc 'Get comment by id'
      get do
        @comment
      end

      desc 'Delete a comment'
      delete do
        @comment.destroy
      end
    end

    desc 'Create v1'
    params do
      requires :article_id, type: Integer
      requires :commenter, type: String
      requires :body, type: String
      requires :status, type: String
    end
    post do
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(params)
      @comment
    rescue ActiveRecord::RecordNotFound => e
      error!('Article Not Found', 404)
    end

    desc 'Update comments v1'
    params do
      requires :id, type: Integer
      requires :commenter, type: String
      requires :body, type: String
      requires :status, type: String
    end
    patch do
      @comment = Comment.find(params[:id])
      @comment.update(params)
      @comment
    rescue ActiveRecord::RecordNotFound => e
      error!('Comment Not Found', 404)
    end
  end
end

