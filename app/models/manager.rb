class Manager < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :authentication_keys => [:username]

  validates :username, uniqueness: true

  has_many :orders, dependent: :destroy
  belongs_to :store, class_name: 'Store', foreign_key: :store_id, optional: true

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
