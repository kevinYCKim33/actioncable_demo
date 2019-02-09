class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # if i go kevin.notifications...i only want notifications where i'm receiving notifications...
  # if i go kevin.notifications...it wouldn't make sense for one of them to say something like "kevin liked john's post"
  has_many :notifications, as: :recipient
end
