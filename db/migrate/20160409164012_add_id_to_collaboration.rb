class AddIdToCollaboration < ActiveRecord::Migration
  def change
    add_column :collaborations, :id, :primary_key
  end
end
