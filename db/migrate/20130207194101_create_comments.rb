class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :guide
      t.references :user
      t.text :body
      t.timestamps
    end

    add_index :comments, [:guide_id, :user_id]
  end
end
