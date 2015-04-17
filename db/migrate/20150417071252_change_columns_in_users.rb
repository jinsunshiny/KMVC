class ChangeColumnsInUsers < ActiveRecord::Migration
  def change
    change_column :users, :mission, :string, :default => ''
    change_column :users, :is_family, :integer, :default => 0
  end
end
