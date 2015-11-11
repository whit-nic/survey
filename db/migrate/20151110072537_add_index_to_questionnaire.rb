class AddIndexToQuestionnaire < ActiveRecord::Migration
  def change
    add_index :questionnaires, :data, using: :gin
  end
end
