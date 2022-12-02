class BrandsController < ApplicationController
    def index
        @brands = Brand.all
        
        render json: @brands.map { |brand|
        if brand.logo.persisted?
            brand.as_json.merge({logo: url_for(brand.logo) })
        end}
        

    end

    def show
        @brand = Brand.find(params[:id])
        render json: @brand.as_json.merge({logo: url_for(@brand.logo)})
    end

    def create
        @brand = Brand.create(
            brand_name: params[:brand_name],
            country: params[:country],
            logo: params[:logo]
        )
        if @brand.persisted?
            render json: @brand
        else
            render json: {status: {
                message: 'Tu madre'
            }}
        end
        
    end

    def update
        @brand = Brand.find(params[:id])
        @brand.update(
            brand_name: params[:brand_name],
            country: params[:country],
            logo: params[:logo]
        )
        render json: @brand
    end

    def destroy
        @brands = Brand.all
        @brand = Brand.find(params[:id])
        @brand.destroy
        render json: @brands
    end

    def logo
        brand = Brand.find(params[:id])

        if brand&.logo&.attached?
            redirect_to rails_blob_url(brand.logo)
        else
            head :not_found
        end
    end
end
