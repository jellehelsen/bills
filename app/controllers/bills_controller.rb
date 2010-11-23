class BillsController < ApplicationController
  before_filter :load

  def load
    @bills = Bill.asc(:due_date)
    @bill = Bill.new
  end
  # GET /bills
  # GET /bills.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bills }
    end
  end

  # GET /bills/1
  # GET /bills/1.xml
  def show
    @bill = Bill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bill }
    end
  end

  # GET /bills/new
  # GET /bills/new.xml
  def new
    @bill = Bill.new

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.xml  { render :xml => @bill }
    end
  end

  # GET /bills/1/edit
  def edit
    @bill = Bill.find(params[:id])
    respond_to do |format|
      format.js
      format.html {render :action => 'index' }
    end
  end

  # POST /bills
  # POST /bills.xml
  def create
    @bills = Bill.all
    @bill = Bill.new(params[:bill])

    respond_to do |format|
      if @bill.save
        format.js do 
          @bills = Bill.asc(:due_date)
          position = @bills.to_a.index {|b| b.id == @bill.id}
          @before_id = "bill_#{@bills[position+1].id}" rescue nil
        end  
        format.html { redirect_to(bills_path, :notice => 'Bill was successfully created.') }
        format.xml  { render :xml => @bill, :status => :created, :location => @bill }
      else
        format.js
        format.html { render :action => "index" }
        format.xml  { render :xml => @bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bills/1
  # PUT /bills/1.xml
  def update
    @bill = Bill.find(params[:id])

    respond_to do |format|
      if @bill.update_attributes(params[:bill])
        format.js   { flash[:notice] = "Bill was successfully updated."}
        format.html { redirect_to(bills_path, :notice => 'Bill was successfully updated.') }
        format.xml  { head :ok }
      else
        format.js 
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.xml
  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to(bills_url) }
      format.xml  { head :ok }
    end
  end

  def pay
    @bill = Bill.find(params[:id])
    @bill.pay!
    @bill.save!
    flash[:notice] = "Bill was marked as payed!"
    respond_to do |format|
      format.js
    end
  end
end
