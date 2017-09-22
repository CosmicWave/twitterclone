class LikesController < ApplicationController



	def create
		@tweet = Tweet.find(params[:tweet_id])
		@like = @tweet.likes.create(user: current_user)
		@like.tweet_id = @tweet.id
		if @like.save
			flash[:notice] = 'Like Created!!'
			redirect_to tweets_path
		end
	end


	
	def destroy

		@tweet = Tweet.find_by(id: params[:id])
		@like = Like.find_by(id: params[:id])
		@like.destroy
		
			redirect_to tweets_path
	end
	
		
	
	

end




