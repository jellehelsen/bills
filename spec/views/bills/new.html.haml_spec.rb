require 'spec_helper'

describe "bills/new.html.haml" do
  before(:each) do
    assign(:bill, stub_model(Bill,
      :description => "MyString",
      :payable_to => "MyString",
      :amount => "MyString",
      :due_date => "MyString"
    ).as_new_record)
  end

  it "renders new bill form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => bills_path, :method => "post" do
      assert_select "input#bill_description", :name => "bill[description]"
      assert_select "input#bill_payable_to", :name => "bill[payable_to]"
      assert_select "input#bill_amount", :name => "bill[amount]"
      assert_select "input#bill_due_date", :name => "bill[due_date]"
    end
  end
end
