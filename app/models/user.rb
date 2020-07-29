class User < ApplicationRecord
    has_many :reviews
    has_many :user_games
    has_many :games, through: :user_games

    validates :name, uniqueness: true
end
