class Brand < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_one_attached :logo, dependent: :destroy
    has_many :models
    validates :brand_name, :logo, presence: true    
end
