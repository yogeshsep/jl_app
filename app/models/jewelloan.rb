class Jewelloan < ActiveRecord::Base

attr_accessor :transaction_amount

attr_accessible :transaction_amount

has_many :jltransactions, :dependent => :destroy

accepts_nested_attributes_for :jltransactions, :allow_destroy => true

attr_accessible :account_number, :customer_name, :customer_address, :opened_on, :due_date, :amount, :jewel, :no_of_items, :gross_weight, :net_weight, :appraised_amount, :loan_amount, :transaction_mode, :transaction_type, :particulars, :comments, :close_date, :jltransactions_attributes

before_create :increment_account_number  
  def increment_account_number
    self.account_number = (self.class.last.nil?) ? "00000001" : ((self.class.last.account_number.to_i) + 1).to_s.rjust(8, '0')
  end

before_create :interest_rate
  def interest_rate
	self.interest_rate = 18.0    	
  end  

#before_save :set_opened_on    
  #def set_opened_on
    #self.opened_on = Date.today.strftime("%d/%m/%Y")
  #end

before_save :due_date
  def due_date
    self.due_date = self.opened_on + 6.months
  end

before_save :set_close_date
  def set_close_date
    self.close_date = Date.today.strftime("%d/%m/%Y")
  end

before_save :set_no_of_days
def set_no_of_days
  self.no_of_days = (self.close_date - self.opened_on).to_i
end

before_save :amount_due
  def amount_due
    self.amount_due = ((self.loan_amount.round * 0.18 * self.no_of_days.to_f)/365).round + self.loan_amount
  end

validates :customer_name, presence: true
validates_numericality_of  :no_of_items
validates :jewel, :no_of_items, :opened_on, :gross_weight, :net_weight, :appraised_amount, :loan_amount, :transaction_mode, :transaction_type, :particulars, presence: true
validates :account_number, uniqueness: true
validate :loan_amount_cannot_be_greater_than_appraised_amount, :net_weight_cannot_be_greater_than_gross_weight

def loan_amount_cannot_be_greater_than_appraised_amount
  if loan_amount > appraised_amount
    errors.add(:loan_amount, "can't be greater than appraised amount")    
  end  
end

def net_weight_cannot_be_greater_than_gross_weight
  if net_weight > gross_weight
    errors.add(:net_weight, "can't be greater than gross weight")    
  end  
end

end

