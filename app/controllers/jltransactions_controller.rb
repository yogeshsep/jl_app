class JltransactionsController < ApplicationController

  def new    
    @jltransaction = Jltransaction.new    
    @jltransaction.jewelloan_id = params[:jewelloan_id][:id]   
  end

  def create
    sleep 2    
    @jltransaction = Jltransaction.create(jltransaction_params)  
    #@jewelloan = Jewelloan.create(jewelloan_params)  
      if @jltransaction.save
        flash[:success] = "Transaction created"
        redirect_to @jltransaction
      else
        flash[:danger] = "Transaction was not created"
        render 'new'
      end
  end

  def edit
    @jltransaction = Jltransaction.find(params[:id])
  end

  def index
    @jltransaction = Jltransaction.order('created_at desc')
  end

  def show
    @jltransaction = Jltransaction.find(params[:id])
    @jewelloan = Jewelloan.all
  end

  def update
    @jltransaction = Jltransaction.find(params[:id])
    if @jltransaction.update_attributes(jltransaction_params)
      flash[:success] = "Transaction was successfully updated"
      redirect_to @jltransaction
    else
      render 'edit'      
    end    
  end

  def destroy
    @jltransaction = Jltransaction.find(params[:id])
    if @jltransaction.destroy
      flash[:danger] = "Transaction was deleted"
      redirect_to jltransactions_path
    else
      render 'new'      
    end   
  end

  private
  def jltransaction_params
    params.require(:jltransaction).permit(:transaction_date, :transaction_amount, :transaction_mode, :transaction_type, :particulars, :comments)
    params.require(:jewelloan).permit(:jewelloan_id, :loan_amount)
  end

end
