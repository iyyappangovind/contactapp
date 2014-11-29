class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :mobile
      t.integer :phone
      t.timestamps
    end
  end
end
