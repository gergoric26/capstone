class Vendor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :items
  has_many :orders
  has_many :vendor_orders


  before_save { self.role ||= :vendor }

  enum role: [:user, :vendor, :admin]


end
