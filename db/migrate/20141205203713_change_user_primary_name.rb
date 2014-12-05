class ChangeUserPrimaryName < ActiveRecord::Migration
  def change
    rename_column :users, :primary, :owner
  end
end
