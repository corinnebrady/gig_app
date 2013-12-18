User.destroy_all
Artist.destroy_all
Event.destroy_all

u1 = User.create(:email => 'b@email.com', :password => 'password', :location => 'sydney')


a1 = Artist.create(:name => "Waits")
a2 = Artist.create(:name => "The Brian Jonestown Massacre")
a3 = Artist.create(:name => "Elvis")
a4 = Artist.create(:name => "Ben David")

#, "Ready For The Fall",



u1.artists = [a1, a2, a3, a4]

