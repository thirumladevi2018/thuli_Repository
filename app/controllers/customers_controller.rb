class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.json
  

  def index
    @customers = Customer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end
# GET /customers/findId
  # GET /customers/findId.json
 def findId
     username=params[:username]
     password=params[:password]
     @customer = Customer.find{ |x| x.name == username && x.password == password }
     if @customer.present?
         redirect_to :controller=>'bookings', :action=>'new' , id: @customer.id 
     else
         redirect_to action: "index"
     end
    #   respond_to do |format|
   #  format.html # show.html.erb
    # format.json { render json: @customer }
    #end
  end
  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])
    pincode=@customer.ward
    zone=0 
    case pincode
    when 600019 then zone=1
    when 600068 then zone=2
    when 600060 then zone=3
    when 600039 then zone=4
    when 600021 then zone=5
    when 600011 then zone=6
    when 600037 then zone=7
    when 600040 then zone=8
    when 600018 then zone=9
    when 600017 then zone=10
    when 600116 then zone=11
    when 600016 then zone=12
    when 600020 then zone=13
    when 600041 then zone=14
    when 600119 then zone=15
    end
    @customer.ward=zone   
      respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])
    
    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end
end