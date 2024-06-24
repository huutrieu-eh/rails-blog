class LatestArticleNotifier
  attr_reader :article, :params

  def initialize(articles)
    @articles = articles
    @success = false
  end

  def call
    ArticleMailer.with(articles: @articles).notify_yesterday_article.deliver_now
    @success = true
    self
  rescue
    @success = false
    self
  end

  def success?
    @success
  end

end