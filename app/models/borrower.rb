class Borrower < ActiveRecord::Base
  has_secure_password
  has_many :histories
  has_many :lenders, through: :histories

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :money, :purpose, :description, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }


end
