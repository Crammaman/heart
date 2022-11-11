class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :view
      t.json :config

      t.timestamps
    end
  end
end
