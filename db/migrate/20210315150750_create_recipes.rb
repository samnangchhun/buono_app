class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :instruction
      t.float :cooking_time

      t.timestamps
    end
  end
end
