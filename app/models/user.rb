# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
has_one :profile

  enum role: [:user, :operator, :chef, :admin]
  
  after_initialize :set_default_role

  def set_default_role
    self.role ||= :user
  end

  def default_profile
    if self.profile.nil?
      profile = Profile.new
      profile.user = self
      profile.save
      self.save      
    end
    self.profile
  end
  
  def friendly_name
  
    if self.default_profile.first_name.nil?
      self.email
    else
      self.profile.full_name
    end
  
  end
  
end
