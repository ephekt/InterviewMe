class Article < ActiveRecord::Base
  acts_as_api do |c|
    c.allow_jsonp_callback = true
  end

  api_accessible :question_answer do |template|
    template.add :id
    template.add :answer_short
    template.add :question_short
    template.add :answer_long
    template.add :question_long
  end
end
