class RoundsController < ApplicationController
  include ApplicationHelper

  def new
  end

  def create
    @round = Round.create( user: current_user )
    @bets = [ params[:bet_1].to_i||0,
              params[:bet_2].to_i||0,
              params[:bet_3].to_i||0,
              params[:bet_4].to_i||0 ]
    4.times do |n|
      Racer.create( odds: rand(1..5),
                    bet: @bets[n],
                    round_id: @round.id )
    end
    @round.set_winner
    @round.set_payout
    render :"rounds/show", :id => @round.id
  end

  def show
  end

  def results
  end
end
