class ChangeDateFormatInMyTable < ActiveRecord::Migration[5.0]
  def up
    change_column :events, :when, :datetime
  end

  def down
    change_column :events, :when, :date
  end
end
