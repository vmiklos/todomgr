class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.datetime :deadline
      t.text :todo
      t.boolean :done
      t.references :user
      t.boolean :public
      t.timestamps
    end
  end
end
