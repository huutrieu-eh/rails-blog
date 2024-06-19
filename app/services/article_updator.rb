class ArticleUpdator
  attr_reader :article, :params

  def initialize(params)
    @params = params
    @success = false
  end

  def call
    @article = Article.find(@params[:id])
    if @article.update(article_params)
      @success = true
    else
      @success = false
    end
    self
  end

  def success?
    @success
  end

  private
  def article_params
    @params.require(:article).permit(:title, :body, :status)
  end

end