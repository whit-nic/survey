class AddSubjectTypeToQuestionnaire < ActiveRecord::Migration
  def change
    add_column :questionnaires, :subject_type, :integer
  end
end
