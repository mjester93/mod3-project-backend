class Api::V1::UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        render json: user.to_json(
            :only => [:id, :name],
            :include => {:games => {
                :only => [:id, :name, :usergame]
            }},
            :methods => [:wishlists],
        )
    end

    def create
        user = User.create(name: params[:name])
        render json: user.to_json(
            :only => [:id, :name],
            :include => {:games => {
                :only => [:id, :name, :usergame]
            }},
            :methods => [:wishlists],
        )
    end

    def find_user
        user = User.find_by(name: params[:name])
        render json: user.to_json(
            :only => [:id, :name],
            :include => {:games => {
                :only => [:id, :name, :usergame]
            }},
            :methods => [:wishlists],
        )
    end
end
