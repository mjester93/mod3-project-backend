class Api::V1::UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        render json: user.to_json()
    end

    def create
        User.create(name: params[:name])
    end
end
