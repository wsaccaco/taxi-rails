# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  first_name          :string
#  last_name           :string
#  born_at             :datetime
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  celular             :string
#  type                :string
#  profie_type         :string
#  profile_type        :string
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Profile < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar,

                    styles: { thumb: '100x100>', medium: '250x250>'},

                    default_url: '/images/:style/missing.jpg'

  validates_attachment :avatar,

                       content_type: { content_type: ['image/jpeg', 'image/png', 'image/gif'] }

  def full_name
    self.first_name + " " + self.last_name
  end
  
end
