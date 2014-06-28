class CreateRacers < ActiveRecord::Migration
  def change
    create_table :racers do |t|
      t.integer :max_steps
      t.integer :odds
      t.integer :bet
      t.belongs_to :round

      t.timestamps
    end
  end
end
