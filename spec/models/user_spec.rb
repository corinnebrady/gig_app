# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  encrypted_password     :string(255)      default(""), not null
#

require 'spec_helper'

describe User do

  it { should have_many :artists }

  before do
    @user = User.create({:email => 'user@email.com', :password => 'password'})
  end

  it 'should have an email' do
    @user.email.present? == true
  end

  it 'should have a password' do
    @user.password.present? == true
  end


end
