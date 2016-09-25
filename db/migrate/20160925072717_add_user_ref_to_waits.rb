class AddUserRefToWaits < ActiveRecord::Migration[5.0]
  def change
    add_reference :waits, :user, foreign_key: true
    add_reference :archived_tasks, :user, foreign_key: true
  end
end
