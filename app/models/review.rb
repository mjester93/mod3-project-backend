class Review < ApplicationRecord
    belongs_to :game
    belongs_to :user

    def reviewed_game
        self.class.select('games.*').joins(:game).where("reviews.id = #{self.id}")
    end
end
