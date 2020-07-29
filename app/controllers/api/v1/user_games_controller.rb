class Api::V1::UserGamesController < ApplicationController
    def create
        user_game = UserGame.create(game_id: params[:game_id], user_id: params[:user_id])
        render json: user_game.to_json(
            include: [:game],
            exclude: [:updated_at, :created_at]
        )
    end
end
