class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

    	t.integer :streak, default: 0
      t.timestamps null: false
    end
  end
end
