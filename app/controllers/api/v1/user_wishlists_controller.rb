class Api::V1::UserWishlistsController < ApplicationController
    def index
        user_wishlist = UserWishlist.first
        render json: user_wishlist.to_json(
            include: [:game],
            exclude: [:updated_at, :created_at]
        )
    end

    def create
        user_wishlist = UserWishlist.create(game_id: params[:game_id], user_id: params[:user_id])
        render json: user_wishlist.to_json(
            include: [:game],
            exclude: [:updated_at, :created_at]
        )
    end
end
