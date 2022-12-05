class ModelsController < ApplicationController
    def index
        @models = Model.all
        
        render json: @models.map{|model| 
            model.as_json(include: :brand).merge({logo: url_for(model.brand.logo)})
        }
        
    end

    def show
        @model = Model.find(params[:id])
        render json: @model.as_json(include: :brand).merge({logo: url_for(@model.brand.logo)})
    end

    def create
        @model = Model.create(
            brand_id: params[:brand_id],
            model_nm: params[:model_nm],
            gen: params[:gen],
            released_at: params[:released_at]
        )
        render json: @model
    end

    def update
        @model = Model.find(params[:id])
        @model.update(
            brand_id: params[:brand_id],
            model_nm: params[:model_nm],
            gen: params[:gen],
            released_at: params[:released_at]
        )
        render json: @model
    end

    def destroy
        @models = Model.all
        @model = Model.find(params[:id])
        @model.destroy
        render json: @models
    end
end
