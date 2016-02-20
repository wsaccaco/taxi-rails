# == Schema Information
#
# Table name: profiles
#
#  id          :integer          not null, primary key
#  first_name  :string
#  last_name   :string
#  born_at     :datetime
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  celular     :string
#  type        :string
#  profie_type :string
#

class Profile < ActiveRecord::Base
  belongs_to :user
  
  def full_name
    self.first_name + " " + self.last_name
  end
  
end
