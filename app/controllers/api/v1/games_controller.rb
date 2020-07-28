class Api::V1::GamesController < ApplicationController
    def show
        game = Game.find(params[:id])

        render json: game.to_json(
            methods: [:ordered_reviews],
            except: [:created_at, :updated_at]
        )
    end
end
