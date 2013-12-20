namespace :gig do
  desc "send monthly email of user's events"
  task :event_email => :environment do
    if Time.now.day == 20
      User.all.each do |user|
        EventMailer.event_email(user).deliver
      end
    end
  end
end
