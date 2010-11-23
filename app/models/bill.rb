class Bill
  include Mongoid::Document
  field :description, :type => String
  field :payable_to, :type => String
  field :amount, :type => Float
  field :paid_on, :type => Time
  field :due_date, :type => Date

  validates_presence_of :description, :payable_to, :amount, :due_date
  validates_numericality_of :amount
  validates_date :due_date

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

  def pay!
    self.paid_on = Time.now
  end
end
