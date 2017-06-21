class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable
  has_many :purchases

  validates :first_name, presence: true, length: {minimum: 3, maximum: 30}
  validates :last_name, presence: true, length: {minimum: 3, maximum: 30}
  validates :email, {
      email: true,
      length: { minimum: 5,  maximum: 50 },
      presence: true,
      uniqueness: true,
      confirmation: true
  }
  validates :is_staff, default: false

  def to_s
    "#{self.first_name} #{self.last_name}"
  end

end
