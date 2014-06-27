class CreateRoundRacers < ActiveRecord::Migration
  def change
    create_table :round_racers do |t|
      t.integer :user_bet
      t.belongs_to :round
      t.belongs_to :racer

      t.timestamps
    end
  end
end
