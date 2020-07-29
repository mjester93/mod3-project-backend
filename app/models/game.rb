class Game < ApplicationRecord
    belongs_to :platform
    has_many :reviews
    has_many :user_games
    has_many :users, through: :user_games
    has_many :user_wishlists
    has_many :users, through: :user_wishlists

    def ordered_reviews
        self.class.select('reviews.id, reviews.score, reviews.summary, users.id AS user_id, users.name AS user_name, reviews.created_at').
        joins("LEFT JOIN reviews ON reviews.game_id = #{self.id} LEFT JOIN users ON users.id = reviews.user_id").
        where('games.id' => self.id)
    end
end