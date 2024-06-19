class ArticleMailer < ApplicationMailer
  default from: ''
  def new_article_email
    @article = params[:article]
    @url = "http://localhost:3000/articles/#{@article.id}"
    attachments.inline['eh-logo.jpeg'] = File.read('public/eh-logo.jpeg')
    mail(to: '', subject: 'A new v1 has been created')
  end
end
