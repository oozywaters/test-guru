class FeedbacksMailer < ApplicationMailer
  before_action :find_admin

  def feedback(user, feedback)
    @feedback = feedback
    @user = user

    mail to: @admin.email, from: user.email, subject: feedback.title
  end

  private

  def find_admin
    @admin = User.find_by(type: 'Admin')
  end
end
