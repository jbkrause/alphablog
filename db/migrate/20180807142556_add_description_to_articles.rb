class AddDescriptionToArticles < ActiveRecord::Migration[5.2]
  def change
    #          table-name  attribute     type
    add_column :articles,  :description, :text
    add_column :articles,  :created_at,  :datetime
    add_column :articles,  :updated_at,  :datetime
  end
end

