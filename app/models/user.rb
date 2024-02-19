class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations
  has_many :events, through: :participations

  after_create :create_iterable_user

  private

  def create_iterable_user
    CreateIterableUser.call(self)
    puts 'Created iterable user'
  end
end
