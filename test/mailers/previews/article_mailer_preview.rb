# Preview all emails at http://localhost:3000/rails/mailers/article_mailer
class ArticleMailerPreview < ActionMailer::Preview
  def new_article_email
    ArticleMailer.with(article: Article.first).new_article_email
  end

end
