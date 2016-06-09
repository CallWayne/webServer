class User < ActiveRecord::Base
  #User has many Messages
  has_many :messages, dependent: :destroy, foreign_key: 'recipient'
  #login name must be unique
  validates :login, uniqueness: true
end

