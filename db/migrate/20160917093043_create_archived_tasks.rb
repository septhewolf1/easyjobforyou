class CreateArchivedTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :archived_tasks do |t|
    	t.date :data_apertura
    	t.date :data_chiusura
    	t.string :chi
    	t.string :stato
    	t.text :note

      t.timestamps
    end
  end
end
