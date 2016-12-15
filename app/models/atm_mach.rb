class AtmMach < ActiveRecord::Base
    geocoded_by :address
   after_validation :geocode, :if => :address_changed?
   
    has_many :transactions
  def show
    session[:atm_no] = @atm_machine.id
  end
  def sort
    scope :sort, -> { order(id: :asc) }
  end
end
