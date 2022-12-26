class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # for socialization
  acts_as_liker

  # relation
  has_one :cart
  has_many :orders, dependent: :destroy
end
