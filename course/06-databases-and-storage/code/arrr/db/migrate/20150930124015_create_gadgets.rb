class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.string :name
      t.belongs_to :widget, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
