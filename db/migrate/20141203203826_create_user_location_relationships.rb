class CreateUserLocationRelationships < ActiveRecord::Migration
  def change
    create_table :user_location_relationships do |t|
      t.references :user
      t.references :location

      t.timestamps
    end
  end
end
