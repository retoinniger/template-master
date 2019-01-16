class User < ApplicationRecord
  #extend Enumerize
  after_initialize :set_default_role
  enum role: [:user, :editor, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]
  
  attr_accessor :login
  
  validates :username, presence: true
  validates :username, uniqueness: {case_sensitive: false}
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end
  
  private

  def set_default_role
    self.role ||= :user
  end
end
