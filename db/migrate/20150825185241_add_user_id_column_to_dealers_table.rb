class AddUserIdColumnToDealersTable < ActiveRecord::Migration
  def change
    add_column :dealers, :user_id, :integer
  end
end
