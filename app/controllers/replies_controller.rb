class RepliesController < ApplicationController

	def index
		@replies = Reply.all
		
	end

	def new
		@tweet = Tweet.find_by(id: params[:tweet_id])
		@reply = Reply.new
	end

	def create
		@tweet = Tweet.find(params[:tweet_id])
		reply_params = params.require(:reply).permit(:body) 
		@reply = Reply.new(reply_params)
		@reply.tweet = @tweet
		if @reply.save
			flash[:notice] = 'Successfully Created!!'
			redirect_to tweets_path
		else
			flash.now[:notice] = 'Not Successfully Created, Try Again'
			render :new
		end
	end


	def show
		@tweet = Tweet.find(params[:tweet_id])
		@reply = Reply.find_by(id: params[:id])
	end

	 def edit
        @tweet = Tweet.find(params[:tweet_id])
		@reply = Reply.find_by(id: params[:id])
    end    

    

    def update
        reply_params = params.require(:reply).permit(:body, :tweet_id)
        @tweet = Tweet.find(params[:tweet_id])
		@reply = Reply.find_by(id: params[:id])        
        if @reply.update(reply_params)
            flash[:success] = "Post updated successfully"
            redirect_to tweets_path
        else
            flash.now[:danger] = "Post was invalid"
            render :edit
        end    
    end


    def destroy
		
		@reply = Reply.find_by(id: params[:id])  
		@reply.destroy
		redirect_to tweets_path
	end




end
	
