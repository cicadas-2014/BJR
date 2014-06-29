class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.belongs_to :user
      t.integer :payout
      t.integer :winner
      t.timestamps
    end
  end
end
