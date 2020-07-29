class Api::V1::UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        render json: user.to_json()
    end

    def create
        user = User.create(name: params[:name])
        render json: user.to_json()
    end
end
