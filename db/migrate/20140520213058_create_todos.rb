class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :text
      t.boolean :completed,  default: false

      t.timestamps
    end
  end
end