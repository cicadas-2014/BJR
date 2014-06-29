class RoundsController < ApplicationController
	include ApplicationHelper

	def new
    @round = Round.create( user_id: session[:id] )
    @bets = [params[:bet_1], params[:bet_2], params[:bet_3], params[:bet_4]]
    4.times do |n|
      Racer.create( odds: rand(1..5),
                    bet: bets[n],
                    round_id: @round.id )
    end
	end

	def create
		round = Round.create(user:current_user)
		redirect_to round_path(round)
	end

	def show

	end


end
