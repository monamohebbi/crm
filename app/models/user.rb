class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :employee
  
  accepts_nested_attributes_for :employee
  
  #after_create :create_employee_for_user
  
  #def create_employee_for_user
  #  Employee.create(:user => self)
  #end
end