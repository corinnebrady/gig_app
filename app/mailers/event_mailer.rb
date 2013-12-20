class EventMailer < ActionMailer::Base
  default from: 'gignotesapp@gmail.com'

  def event_email(user)
    #BELOW include ALL variable that will be used inised the actual emails.  Set them up here!
    @user = user

    mail(to: user.email, subject: 'Gig Notes - Upcoming Gigs')
  end
end
