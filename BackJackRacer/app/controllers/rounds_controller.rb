class RoundsController < ApplicationController


	def new

	end

	def create
		round = Round.create(user:current_user)
		rediret_to round_path(round)
	end

	def show

	end


end
