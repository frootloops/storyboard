class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.references :user
      t.references :topic

      t.string :title
      t.string :description
      t.string :slug
      t.string :supply, array: true
      t.integer :likes, array: true
      t.integer :views
      t.integer :state, default: 0

      t.timestamps
    end

    add_attachment :guides, :intro_image
    add_index :guides, [:user_id, :topic_id]
  end
end
