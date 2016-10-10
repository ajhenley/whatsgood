class AddWhenendToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :whenend, :datetime
  end
end
