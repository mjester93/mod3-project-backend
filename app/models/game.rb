class Game < ApplicationRecord
    belongs_to :platform
    has_many :reviews

    def ordered_reviews
        self.reviews.order('created_at desc')
    end
end