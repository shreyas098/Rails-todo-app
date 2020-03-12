class AddCheckboxToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :checkbox, :boolean
  end
end
