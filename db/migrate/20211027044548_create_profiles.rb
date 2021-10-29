class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name, default: "Noname"
      t.datetime :birthday
      t.string :home_town
      t.string :gender

      t.timestamps
    end
  end
end
