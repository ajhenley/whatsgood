class AddHappensatToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :happensat, :string
  end
end
