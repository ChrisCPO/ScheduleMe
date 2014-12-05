class AddPrimaryBoolToUsers < ActiveRecord::Migration
  def change
    add_column :users, :primary, :boolean, default: false
  end
end
