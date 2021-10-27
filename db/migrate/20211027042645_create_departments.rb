class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.bigint :leader_id

      t.timestamps
    end
  end
end
