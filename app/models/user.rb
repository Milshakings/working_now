class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  accepts_nested_attributes_for :images
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
