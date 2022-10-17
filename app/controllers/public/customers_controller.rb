class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
  end
  
  def update
# NOT SURE
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to my_page_path
  end
  
  def unsbscribe
  end
  
  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    redirect_to destroy_customer_session_path
  end
  
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :adress, :telephone_number, :email)
  end
end
