class RemoveTimeStampFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :create_at, :datetime
    remove_column :articles, :update_at, :datetime
  end
end
