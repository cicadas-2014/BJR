class RoundsController < ApplicationController
	include ApplicationHelper

	def new
		p current_user
    p session[:user_id]

	end

	def create
		p current_user
		round = Round.create(user:current_user)
		redirect_to round_path(round)
	end

	def show

	end


end
