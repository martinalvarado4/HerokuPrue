class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :serials, dependent: :destroy
  has_many :reviewses, dependent: :destroy
  has_many :chapters
  has_many :reviewches, dependent: :destroy
  has_many :noticions, dependent: :destroy
  has_and_belongs_to_many :vistos, optional: true
  has_many :child, :class_name => "User"
  belongs_to :parent, :class_name => "User" , optional: true
end
