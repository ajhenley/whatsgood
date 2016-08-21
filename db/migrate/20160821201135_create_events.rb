class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :what
      t.text :description
      t.date :when
      t.references :spots, foreign_key: true

      t.timestamps
    end
  end
end
