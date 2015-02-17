class Jltransaction < ActiveRecord::Base

  belongs_to :jewelloan 

  attr_accessor :loan_amount

  attr_accessible :loan_amount
  
  attr_accessible :transaction_date, :transaction_amount, :transaction_mode, :transaction_type, :particulars, :comments, :jewelloan_id
  
  before_save :set_default_date

  def set_default_date
    self.transaction_date = Date.today
  end

  validates :transaction_amount, :transaction_mode, :transaction_type, :particulars, presence: true

end
