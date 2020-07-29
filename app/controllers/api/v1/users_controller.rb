class Api::V1::UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        render json: user.to_json(
            include: [:games]
        )
    end

    def create
        user = User.create(name: params[:name])
        render json: user.to_json(
            include: [:games]
        )
    end

    def find_user
        user = User.find_by(name: params[:name])
        render json: user.to_json(
            include: [:games]
        )
    end
end
