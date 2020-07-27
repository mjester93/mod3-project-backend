class Api::V1::PlatformsController < ApplicationController
    def index
        platforms = Platform.order(:name)

        render json: platforms.to_json(
            except: [:created_at, :updated_at]
        )
    end

    def show
        platform = Platform.find(params[:id])

        render json: platform.to_json(
            methods: [:ordered_games],
            except: [:created_at, :updated_at]
        )
    end
end
