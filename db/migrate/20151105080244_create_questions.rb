class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :field_type
      t.references :category, index: true, foreign_key: true
      t.boolean :required

      t.timestamps null: false
    end
  end
end
