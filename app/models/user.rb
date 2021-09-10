class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
        products.order(:star_rating).last
    end

    def remove_reviews(product)
        reviews = self.reviews.find_by_product_id(product.id)
        if reviews 
            reviews.destroy
        end
    end
end