# Perform CRUD operations on a customer
class Api::Business::V1::CustomersController < Api::Business::V1::BaseController

  # Returns a list of the authenticated business' customers
  def index
    # .to_a because tests don't expect a Mongoid::Criteria
    @customers = @business.customers.asc(:email).to_a
    render json: @customers
  end

  # @param id Customer id
  # Returns details of the customer
  def show
    @customer = @business.customers.find(params[:id])
    render json: @customer
  end

  # Creates a new customer, returns details of said customer on success.
  def create
    @customer = @business.customers.new(params[:customer])
    if @customer.save
      render status: 201, json: @customer
    else
      render status: 400, json: { 
        message: "A customer could not be created.", 
        errors: @customer.errors 
      }
    end
  end

  # @param id Customer id
  # Deletes a customer
  def destroy
    @customer = @business.customers.find(params[:id])
    if @customer.destroy
      render status: 200, json: { message: "Customer deleted." }
    else
      render status: 500, json: { message: "Customer could not be deleted." }
    end
  end
end