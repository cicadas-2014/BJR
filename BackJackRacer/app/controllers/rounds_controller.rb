class RoundsController < ApplicationController
  include ApplicationHelper

  def new
    @odds = [rand(1..10),rand(1..10),rand(1..10),rand(1..10)]
  end

  def create
    raise params.inspect
    @round = Round.create( user: current_user )
    @bets = [ params[:bet_1].to_i||0,
             params[:bet_2].to_i||0,
             params[:bet_3].to_i||0,
             params[:bet_4].to_i||0 ]
    @odds = [ params[:odds1],
              params[:odds2],
              params[:odds3],
              params[:odds4] ]
    4.times do |n|
      Racer.create( odds: @odds(n),
                    bet: @bets[n],
                    round_id: @round.id )
    end
    redirect_to round_path(@round.id)
  end

  def show
    @round = Round.find(params[:id])
    @winner_number = @round.set_winner
    @round.set_payout
    if @round.user
      @round.user.funds += @round.payout
      @round.user.save
    end
    @round.save
    case @winner_number
    when 1 then @winner_color = "red"
    when 2 then @winner_color = "green"
    when 3 then @winner_color = "yellow"
    when 4 then @winner_color = "blue"
    end
    render :"rounds/show", :id => @round.id
  end

  def results
    @round = Round.find(params[:id])
    @user = @round.user
    @payout = space(@round.payout)
    @funds = space(@round.user.funds)
  end

  def space(number)
   number.to_s.gsub(/\D/, '').reverse.gsub(/.{3}/, '\0 ').reverse
  end
end
