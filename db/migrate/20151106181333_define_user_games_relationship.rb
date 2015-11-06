class DefineUserGamesRelationship < ActiveRecord::Migration
  def change
  	add_reference :games, :user, index: true
  	add_foreign_key :uploads, :users
  end
end
