class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.text :answer_long
      t.string :answer_short
      t.text :question_long
      t.string :question_short

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
