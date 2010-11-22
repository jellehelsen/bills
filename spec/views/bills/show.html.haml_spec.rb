require 'spec_helper'

describe "bills/show.html.haml" do
  before(:each) do
    @bill = assign(:bill, stub_model(Bill,
      :description => "Description",
      :payable_to => "Payable To",
      :amount => "Amount",
      :due_date => "Due Date"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Payable To/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Amount/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Due Date/)
  end
end
