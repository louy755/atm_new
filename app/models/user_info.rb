class UserInfo < ActiveRecord::Base
  belongs_to :user
  has_one :account
  validates :first_name,:last_name,:city,:state, :phone, :presence => true      
  validates_format_of :phone,:with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,:message => "- Phone numbers must be in xxx-xxx-xxxx format."
  validates :first_name, uniqueness: { scope: [:last_name, :phone] , message: "or last name should be unique" },case_sensitive: false
  after_create :create_account

  private
    def create_account
      Account.create(user_id: user_id , balance: 0.0)
    end

 mount_uploader :image, ImageUploader
    #validates_format_of :image, :with => %r{\.(jpg|jpeg)$}i, :message => "Only JPG Format"
    validate :image_size_validation
    
    
    def image_size_validation
     errors[:image] << "should be less than 5MB" if image.size > 5.megabytes
    end
   

end
