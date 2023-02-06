class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :username, presence: true, uniqueness: true, length: {in: 6..20}
    validates :email, presence: true, uniqueness: true
    validates :password, length: {in: 6..20}

    has_many :posts
end
