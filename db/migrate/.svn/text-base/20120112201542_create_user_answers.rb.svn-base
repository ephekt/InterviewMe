class CreateUserAnswers < ActiveRecord::Migration
  def self.up
    create_table :user_answers do |t|
      t.string :answer
      t.integer :question_id
      t.string :difficulty
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :user_answers
  end
end
