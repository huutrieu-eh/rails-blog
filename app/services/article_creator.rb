class ArticleCreator
  attr_reader :article

  def initialize(params)
    @params = params
    @success = false
  end

  def call
    @article = Article.new(@params)
    if @article.save
      @success = true
    else
      @success = false
    end
    self
  end

  def success?
    @success
  end

end