class StatusUpdate < ActiveRecord::Base

validates :status, :user, :number_of_likes, presence: true

end
