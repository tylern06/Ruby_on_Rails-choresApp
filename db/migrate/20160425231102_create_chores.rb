class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :title
      t.text :description
      t.float :rate
      t.datetime :start
      t.datetime :end
      t.string :status
      t.references :client, index: true
      t.references :contractor, index: true

      t.timestamps
    end
  end
end
