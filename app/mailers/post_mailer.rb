class PostMailer < ActionMailer::Base
  default from: Configurable.blog_emailer_address

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.new_post.subject
  #
  def new_post(post, email_recipient)
    @post = post
    @announcee = email_recipient
    @groups = @post.groups & @announcee.groups
    mail to: @announcee.email,
         subject: "#{Configurable.site_title}: #{post.title}"
  end
end
