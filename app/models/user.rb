class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :rememberable
    #, #:database_authenticatable, :recoverable, :validatable
  has_many :log_entries
end
