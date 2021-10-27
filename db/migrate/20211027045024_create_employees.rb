class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :user, null: false , foreign_key: true
      t.string :address
      t.string :phone_number
      t.datetime :working_day
      t.references :role, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
