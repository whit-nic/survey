class AddQuestionNoToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :question_no, :string
  end
end
