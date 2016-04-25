class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :client, index: true
      t.references :contractor, index: true

      t.timestamps
    end
  end
end
