class User < ApplicationRecord
    has_many :reviews
    has_many :user_games
    has_many :games, through: :user_games
    has_many :user_wishlists
    has_many :games, through: :user_wishlists

    validates :name, uniqueness: true

    def owned_games
        self.user_games.map {|user_game| user_game.game}
    end

    def wishlist_games
        self.user_wishlists.map {|wishlist| wishlist.game}
    end

    def all_reviews

        final_reviews = [];

        self.reviews.each do |review| 
            final_reviews << [review, review.game]
        end

        return final_reviews
    end
end
