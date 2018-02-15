class HomeController < ApplicationController

	def index

	end


	def tweet

		@message = tweet_params[:content]

		if SendTweet.new(@message).perform

			flash[:success] = 'Tweet sent ;)'

			redirect_to root_path

		else

			flash[:danger] = 'Something went wrong :('

			redirect_to root_path

		end

	end



	private 

	def tweet_params

		params.require(:tweet).permit(:content)

	end

end
