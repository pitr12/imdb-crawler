class AddDurationToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :duration, :integer, null: false
  end
end
