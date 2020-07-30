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
        user_game = UserGame.find_by(user_id: params[:id], game_id: params[:game_id])
        UserGame.destroy(user_game.id)

        render json: user_game.game.to_json()
    end

    def delete_wishlist
        user = User.find(params[:id])
        user_wishlist = UserWishlist.find_by(user_id: params[:id], game_id: params[:game_id])
        UserWishlist.destroy(user_wishlist.id)

        render json: user_wishlist.game.to_json()
    end
end
