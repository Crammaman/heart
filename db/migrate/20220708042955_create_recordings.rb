class CreateRecordings < ActiveRecord::Migration[7.0]
  def change
    create_table :recordings do |t|
      t.references :device, null: false, foreign_key: true
      t.json :data

      t.timestamps
    end
  end
end
