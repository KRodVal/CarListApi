class Brand < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_one_attached :logo
    has_many :models
    validates :brand_name, presence: true

    def logo_url
        # url_for(logo)
        rails_blob_path(logo, disposition: "attachment")
    end
    
end
