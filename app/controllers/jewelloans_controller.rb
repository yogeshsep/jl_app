class JewelloansController < ApplicationController

  def new
    @jewelloan = Jewelloan.new
  end

  def create
    sleep 2
    @jewelloan = Jewelloan.create(jewelloan_params)
      if @jewelloan.save
        flash[:success] = "Special JL was successfully created"
        redirect_to @jewelloan
      else
        flash[:danger] = "Special Jewel Loan was not created"
        render 'new'
      end
  end

  def edit
    @jewelloan = Jewelloan.find(params[:id])
  end

  def index
    @jewelloan = Jewelloan.order('created_at desc').paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @jewelloan = Jewelloan.find(params[:id])
    @jltransaction = Jltransaction.all
  end

  def update
    @jewelloan = Jewelloan.find(params[:id])
    if @jewelloan.update_attributes(jewelloan_params)
      flash[:success] = "Special JL was successfully updated"
      redirect_to @jewelloan
    else
      render 'edit'      
    end    
  end

  def destroy
    @jewelloan = Jewelloan.find(params[:id])
    if @jewelloan.destroy
      flash[:danger] = "Special JL was deleted"
      redirect_to jewelloans_path
    else
      render 'new'      
    end   
  end

  private

  def jewelloan_params
    params.require(:jewelloan).permit(:account_number, :customer_name, :customer_address, :amount, :interest_rate, :opened_on, :due_date, :amount_due, :jewel, :no_of_items, :gross_weight, :net_weight, :appraised_amount, :loan_amount, :transaction_mode, :transaction_type, :particulars, :comments)
  end

end
