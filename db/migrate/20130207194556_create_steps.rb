class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :guide
      t.string :title
      t.string :description

      t.timestamps
    end

    add_attachment :steps, :media
    add_index :steps, :guide_id
  end
end
