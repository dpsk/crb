class CreaeAdverts < ActiveRecord::Migration
  def up
    create_table :adverts do |t|
      t.string :title
      t.text :content
      t.integer :user_id
    end

    add_index :adverts, :user_id
  end

  def down
    remove_table :adverts
  end
end
