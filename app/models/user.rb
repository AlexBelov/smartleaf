class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable
  has_many :purchases
end
