require 'spec_helper'

describe BillsController do
  before(:each) do
    @user = Fabricate(:user)
    #sign_in :user, @user
    request.env['warden'] = mock(Warden, :authenticate => @user,
                                             :authenticate! => @user)
    
  end

  def bson_id
    @bson_id ||= BSON::ObjectId.new.to_s
  end
  def mock_bill(stubs={})
    (@mock_bill ||= Bill.new).tap do |bill|
      bill.stub(stubs) unless stubs.empty?
      #bill.stub(:to_ary => [bill])
    end
  end

  describe "GET index" do
    it "assigns all bills as @bills" do
      #Bill.stub(:all) { [mock_bill] }
      debugger
      @user.bills[1].paid_on = Date.today - 1
      @user.save
      bill_count = @user.bills.count
      get :index
      assigns(:bills).should eq(@user.bills.excludes(:paid_on.lt => Date.today).asc(:due_date).to_a)
      assigns(:bills).count.should_not == bill_count
    end
  end

  #describe "GET show" do
    #it "assigns the requested bill as @bill" do
      #Bill.stub(:find).with("37") { mock_bill }
      #get :show, :id => "37"
      #assigns(:bill).should be(mock_bill)
    #end
  #end

  #describe "GET new" do
    #it "assigns a new bill as @bill" do
      #Bill.stub(:new) { mock_bill }
      #get :new
      #assigns(:bill).should be(mock_bill)
    #end
  #end

  #describe "GET edit" do
    #it "assigns the requested bill as @bill" do
      #Bill.stub(:find).with("37") { mock_bill }
      #get :edit, :id => "37"
      #assigns(:bill).should be(mock_bill)
    #end
  #end

  describe "POST create" do
    before(:each) do 
      #@user.bills.stub(:<<)        
      #Bill.stub(:new)
    end

    describe "with valid params" do
      it "assigns a newly created bill as @bill" do
        @bill = mock_bill(:save => true)
        Bill.stub(:new)
        Bill.stub(:new).with({'these' => 'params'}) { @bill }
        post :create, :bill => {'these' => 'params'}, :format => :js
        assigns(:bill).should be(mock_bill)
      end

      it "renders the 'create' template" do
        @bill = mock_bill(:save => true)
        Bill.stub(:new) { @bill }
        post :create, :bill => {}, :format => :js
        response.should render_template("create")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bill as @bill" do
        @bill = mock_bill(:save => false)
        Bill.stub(:new)
        Bill.stub(:new).with({'these' => 'params'}) { @bill }
        post :create, :bill => {'these' => 'params'}, :format => :js
        assigns(:bill).should be(@bill)
      end

      it "renders the 'create' template" do
        @bill = mock_bill(:save => false)
        Bill.stub(:new) { @bill }
        post :create, :bill => {}, :format => :js
        response.should render_template("create")
      end
    end

  end

  describe "PUT update" do
    before(:each) do 
      #@user.bills.stub(:<<)        
      #Bill.stub(:new)
    end

    describe "with valid params" do
      it "updates the requested bill" do
        @user.bills.should_receive(:find).with(bson_id) { mock_bill }
        mock_bill.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => bson_id, :bill => {'these' => 'params'}, :format => :js
      end

      it "assigns the requested bill as @bill" do
        @user.bills.stub(:find) { mock_bill(:update_attributes => true) }
        put :update, :id => bson_id, :format => :js
        assigns(:bill).should be(mock_bill)
      end

      it "succeeds" do
        @user.bills.stub(:find) { mock_bill(:update_attributes => true) }
        put :update, :id => bson_id, :format => :js
        response.should be_success
      end
      it "renders the 'update' template" do
        @user.bills.stub(:find) { mock_bill(:update_attributes => false) }
        put :update, :id => bson_id, :format => :js
        response.should render_template("update")
      end
      
    end

    describe "with invalid params" do
      it "assigns the bill as @bill" do
        @user.bills.stub(:find) { mock_bill(:update_attributes => false) }
        put :update, :id => bson_id, :format => :js
        assigns(:bill).should be(mock_bill)
      end

      it "re-renders the 'update' template" do
        @user.bills.stub(:find) { mock_bill(:update_attributes => false) }
        put :update, :id => bson_id, :format => :js
        response.should render_template("update")
      end
    end

  end

  #describe "DELETE destroy" do
    #it "destroys the requested bill" do
      #Bill.should_receive(:find).with("37") { mock_bill }
      #mock_bill.should_receive(:destroy)
      #delete :destroy, :id => "37"
    #end

    #it "redirects to the bills list" do
      #Bill.stub(:find) { mock_bill }
      #delete :destroy, :id => "1"
      #response.should redirect_to(bills_url)
    #end
  #end

end
