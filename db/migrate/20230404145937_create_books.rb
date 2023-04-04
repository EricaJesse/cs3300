class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :plot
      t.integer :rating
      t.date :date_completed

      t.timestamps
    end
  end
end
