class RoundsController < ApplicationController
	include ApplicationHelper

	def new

	end

	def create
		round = Round.create(user:current_user)
		redirect_to round_path(round)
	end

	def show

	end


end
