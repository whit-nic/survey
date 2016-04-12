class CreateCorps < ActiveRecord::Migration
  def change
    create_table :corps do |t|
      t.string :q1
      t.integer :q2
      t.integer :q3
      t.integer :q4
      t.integer :q5
      t.integer :q6
      t.integer :q7
      t.integer :q8
      t.integer :q9
      t.integer :q10
      t.integer :q11
      t.integer :q12
      t.integer :q13
      t.integer :q14
      t.integer :q15
      t.text :q16

      t.timestamps null: false
    end
  end
end
