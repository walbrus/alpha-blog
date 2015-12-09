class FixUpdatedAtColumn < ActiveRecord::Migration
  def change
    remove_column :articles, :updated_ad
    add_column :articles, :updated_at, :datetime
  end
end
