class UserPrimaryNull < ActiveRecord::Migration
  def change
    change_column_null :users, :primary, false
  end
end
