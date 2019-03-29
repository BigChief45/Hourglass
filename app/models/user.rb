class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :punchcards, dependent: :destroy

  enum membership_plan: { free: 0, premium: 1 }

  def initial
    self.email[0].upcase
  end
end
