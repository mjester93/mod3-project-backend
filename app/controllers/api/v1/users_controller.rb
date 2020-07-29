class Api::V1::UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        render json: user.to_json(
            :only => [:id, :name],
            :include => {
                :reviews => {
                    :include => [:game],
                    :only => [:id, :score, :summary]
                }
            },
            :methods => [:owned_games, :wishlist_games]
        )
    end

    def create
        user = User.create(name: params[:name])
        render json: user.to_json(
            :only => [:id, :name],
            :include => {
                :reviews => {
                    :include => [:game],
                    :only => [:id, :score, :summary]
                }
            },
            :methods => [:owned_games, :wishlist_games]
        )
    end

    def find_user
        user = User.find_by(name: params[:name])
        render json: user.to_json(
            :only => [:id, :name],
            :include => {
                :reviews => {
                    :include => [:game],
                    :only => [:id, :score, :summary]
                }
            },
            :methods => [:owned_games, :wishlist_games]
        )
    end

    def delete_game
        user = User.find(params[:id])
        game = user.owned_games.delete(params[:game_id])

        render json: game
    end
end
