class Api::Business::V1::PurchasesController < Api::Business::V1::BaseController
  before_filter :get_customer!

  def index
    @purchases = @customer.purchases
    render json: @purchases
  end

  def show
    @purchase = @customer.purchases.find(params[:id])
    render json: @purchase
  end

  def create
    @package = @business.packages.find(purchase_params[:package_id])
    @purchase = @customer.purchases.build(
      purchase_date: purchase_params[:purchase_date],
      package: @package
    )
    if @purchase.save
      render status: 201, json: @purchase
    else
      render status: 400, json: { 
        message: "A purchase could not be created.",
        errors: @purchase.errors
      }
    end
  end

  # Delete a purchase from a customer
  # @param :customer_id Customer id
  # @param :id Purchase id
  def destroy
    @purchase = @customer.purchases.find(params[:id])
    if @purchase.destroy
      render status: 200, json: { message: "Purchase deleted." }
    else
      render status: 500, json: { message: "Purchase could not be deleted." }
    end
  end

  private
  def get_customer!
    @customer = @business.customers.find(params[:customer_id])
  end

  def purchase_params
    params[:purchase].slice(:package_id, :purchase_date)
  end
end