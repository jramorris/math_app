class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = 'User created!'
			redirect_to root_path
		else
			flash[:alert] = 'Oops! Something went wrong...'
			render 'new'
		end
  end

  def show
  	@user = User.find(params[:id])
  end

  def index
  	@users = User.all
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :username)
  end
end
