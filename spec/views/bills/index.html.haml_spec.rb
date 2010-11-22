require 'spec_helper'

describe "bills/index.html.haml" do
  before(:each) do
    assign(:bills, [
      stub_model(Bill,
        :description => "Description",
        :payable_to => "Payable To",
        :amount => "Amount",
        :due_date => "Due Date"
      ),
      stub_model(Bill,
        :description => "Description",
        :payable_to => "Payable To",
        :amount => "Amount",
        :due_date => "Due Date"
      )
    ])
  end

  it "renders a list of bills" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payable To".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Amount".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Due Date".to_s, :count => 2
  end
end
