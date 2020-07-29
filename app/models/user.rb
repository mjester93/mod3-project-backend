class User < ApplicationRecord
    has_many :reviews
    has_many :user_games
    has_many :games, through: :user_games
    has_many :user_wishlists

    validates :name, uniqueness: true

    def wishlists
        self.class.select("user_wishlists.id, games.id AS 'game_id', games.name").
        joins("LEFT JOIN user_wishlists ON #{self.id} = user_wishlists.user_id LEFT JOIN games ON games.id = user_wishlists.game_id").
        where('users.id' => self.id)
    end
end
