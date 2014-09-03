class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :user
      t.string :subject
      t.text :question

      t.timestamps
    end
  end
end
