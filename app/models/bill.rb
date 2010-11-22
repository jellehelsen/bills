class Bill
  include Mongoid::Document
  field :description, :type => String
  field :payable_to, :type => String
  field :amount, :type => BigDecimal
  field :paid_on, :type => Date
  field :due_date, :type => Date

  validates_presence_of :description, :payable_to, :amount, :due_date

  def payed?
    !paid_on.nil?
  end

  def view_class
    today = Date.today

    return :green if payed?
    return :red if (due_date < today)
    return :green if (due_date > today + 10)
    return :orange
  end
end
