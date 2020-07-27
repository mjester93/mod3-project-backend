class Platform < ApplicationRecord
    has_many :games

    def ordered_games
        self.games.order(:name)
    end
end
