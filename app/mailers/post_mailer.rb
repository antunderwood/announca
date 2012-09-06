class PostMailer < ActionMailer::Base
  default from: "email2ants@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.new_post.subject
  #
  def new_post(post)
    @post = post
    mail to: Announcee.mail_recipients_for_post(post).map{|announcee| announcee.email},
         subject: "Announca: #{post.title}"
  end
end
