class AddRoleIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role_id, :bigint
    add_foreign_key :users, :roles, column: :role_id, primary_key: "id"

    add_column :users, :department_id, :bigint
    add_foreign_key :users, :departments, column: :department_id, primary_key: "id"
    # t.references :department,null: false, foreign_key: true
  end
end
