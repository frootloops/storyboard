class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.references :user
      t.references :topic

      t.string :title
      t.string :description
      t.string :slug
      t.string :supply, array: true
      t.integer :views, default: 0
      t.integer :state, default: 0
      t.string :intro_image

      t.timestamps
    end
    add_index :guides, [:user_id, :topic_id]
  end
end
