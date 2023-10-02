class RemoveUniqueConstraintFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, [:uid, :provider]
  end
end
