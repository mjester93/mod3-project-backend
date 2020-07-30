class Api::V1::ReviewsController < ApplicationController    
    def create
        review = Review.create(
            game_id: params[:game_id],
            user_id: params[:user_id],
            score: params[:score],
            summary: params[:summary]
        )

        render json: review.to_json(
            :include => [:game],
            :only => [:id, :score, :summary]
        )
    end

    def destroy
        review = Review.find(params[:review_id])
        review.destroy

        render json: review
    end
end
