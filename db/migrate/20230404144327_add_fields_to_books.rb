class AddFieldsToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :title, :string
    add_column :books, :plot, :text
    add_column :books, :rating, :integer
    add_column :books, :date_completed, :date
  end
end
