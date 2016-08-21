class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :hours
      t.string :phone
      t.string :address
      t.string :description
      t.string :social_twitter
      t.string :social_fb
      t.string :social_isntagram
      t.string :social_pinsterest
      t.string :tags

      t.timestamps
    end
  end
end
