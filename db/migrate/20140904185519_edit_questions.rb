class EditQuestions < ActiveRecord::Migration
  def change
    add_column(:questions, :favorite_answer, :integer)
  end
end
