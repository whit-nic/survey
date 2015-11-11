class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.inet :ip
      t.hstore :data

      t.timestamps null: false
    end
  end
end
