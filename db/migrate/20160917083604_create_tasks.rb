class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.date :data_apertura
      t.string :chi
      t.string :stato
      t.text :note

      t.timestamps
    end
  end
end
