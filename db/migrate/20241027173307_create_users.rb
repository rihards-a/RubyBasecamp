class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      # added null:false so cant be entered without email
      t.string :email, null: false
      t.string :password_digest
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
