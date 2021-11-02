class CreateProjectDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :project_details do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.index [:employee_id, :project_id]

      t.timestamps
    end
  end
end
