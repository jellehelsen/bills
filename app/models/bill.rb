class Bill
  include Mongoid::Document
  field :description, :type => String
  field :payable_to, :type => String
  field :amount, :type => BigDecimal
  field :paid_on, :type => Date
  field :due_date, :type => Date

  validates_presence_of :description, :payable_to, :amount, :due_date

  def payed?
    !payable_to.nil?
  end
end
