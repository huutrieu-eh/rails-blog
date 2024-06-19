class ArticleObserver < ActiveRecord::Observer
  observe :article
  def after_create(article)
    MailJob.perform_async(article.id)
  end
end