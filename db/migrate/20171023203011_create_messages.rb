class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.text :description
      t.integer :receiver_id
      t.integer :sender_id

      t.timestamps null: false
    end
  end
end
