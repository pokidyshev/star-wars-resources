class User < ApplicationRecord
  # Include devise modules
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         # :lockable,
         # :omniauthable,
         :timeoutable
end
