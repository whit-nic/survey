class AddSituationToQuestionnaires < ActiveRecord::Migration
  def change
    add_column :questionnaires, :gender, :integer
    add_column :questionnaires, :grade, :integer
    add_column :questionnaires, :local, :integer
    add_column :questionnaires, :hope, :integer
    add_column :questionnaires, :learn_status, :integer
    add_column :questionnaires, :edu, :integer
    add_column :questionnaires, :income, :integer
    add_column :questionnaires, :school, :string
    add_column :questionnaires, :position, :integer
    add_column :questionnaires, :school_position, :integer
    add_column :questionnaires, :known, :integer
  end
end
