class Api::Business::V1::PackagesController < Api::Business::V1::BaseController
  def index
    @packages = @business.packages
    render json: @packages
  end

  def show
    @package = @business.packages.find(params[:id])
    render json: @package
  end

  def create
    @package = @business.packages.new(params[:package])
    
    if @package.save
      render status: 201, json: @package
    else
      render status: 400, json: { 
        message: "A package could not be created.",
        errors: @package.errors
      }
    end
  end

  def update
    @package = @business.packages.find(params[:id])

    if @package.update_attributes(params[:package])
      render json: @package
    else
      render status: 400, json: {
        message: "Package could not be updated.",
        errors: @package.errors
      }
    end
  end

  def destroy
    @package = @business.packages.find(params[:id])

    if @package.destroy
      render status: 200, json: { message: "Package deleted." }
    else
      render status: 500, json: { message: "Package could not be deleted." }
    end
  end

  private
  def package_params
    params[:package].slice(
      :name, :description, :price, :number_of_extensions, :number_of_domains,
      :is_subscription, :validity, :frequency, :extension_ids, :has_all_extensions
    )
  end
end