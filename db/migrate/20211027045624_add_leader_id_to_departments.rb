class AddLeaderIdToDepartments < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :departments, :employees, column: :leader_id, primary_key: "id"
  end
end
