class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :password_digest
      t.string :nickname
      t.string :phone_num
      t.string :email
      t.string :address
      t.string :mission
      t.integer :is_family

      t.timestamps
    end
  end
end
