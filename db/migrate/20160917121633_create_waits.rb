class CreateWaits < ActiveRecord::Migration[5.0]
  def change
    create_table :waits do |t|
    	t.date :data_apertura
    	t.date :data_scadenza
    	t.date :data_chiusura
    	t.string :chi
    	t.string :stato
    	t.text :note

     	t.timestamps
    end
  end
end
