require 'spec_helper'

describe Bill do
  it { should validate_presence_of :description}
  it { should validate_presence_of :payable_to}
  it { should validate_presence_of :due_date}
  it { should validate_presence_of :amount}
  it { should be_embedded_in(:user).as_inverse_of(:bills) }
end
