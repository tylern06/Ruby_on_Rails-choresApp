class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :city
      t.string :state
      t.float :rating
      t.references :contractor, index: true

      t.timestamps
    end
  end
end
