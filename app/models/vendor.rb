class Vendor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :items


  before_save { self.role ||= :user }

  enum role: [:user, :vendor, :admin]



  #scope :visible_to, ->(vendor) { vendor ? all : where(@item.vendor) }
end
