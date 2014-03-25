class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.string :gender
      t.string :activity

      t.timestamps
    end
  end
end
