class Api::V1::PlatformsController < ApplicationController
    def index
        platforms = Platform.order(:name)

        render json: platforms.to_json(
            :include => {
                :games => {
                    :except => [:platform_id, :created_at, :updated_at]
                }
            },
            except: [:created_at, :updated_at]
        )
    end
end
