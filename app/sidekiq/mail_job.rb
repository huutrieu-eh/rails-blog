class MailJob
  include Sidekiq::Job

  def perform(id)
    @article = Article.find(id)
    ArticleMailer.with(article: @article).new_article_email.deliver_now
  end
end
