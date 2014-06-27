class CreateRacers < ActiveRecord::Migration
  def change
    create_table :racers do |t|
      t.integer :max_steps
      t.integer :odds

      t.timestamps
    end
  end
end
