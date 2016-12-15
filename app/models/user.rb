class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_one :account  ,dependent: :destroy
         has_one :user_info  ,dependent: :destroy
         validates_format_of :password, :with => /(?=.*\d)(?=.*([a-z]|[A-Z])){8,40}/,:message => "Password must contain Uppecase and lowercase letter with a number !"
end
