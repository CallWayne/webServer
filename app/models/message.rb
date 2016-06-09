class Message < ActiveRecord::Base
  #One Message belongs to User
  belongs_to :user
end
