FactoryGirl.define do
  factory :question do |f|
	  f.title { Faker::Name.title }
	  f.content { Faker::Lorem.sentences }
	  f.correct_answer { Faker::Lorem.word }
	  f.user_id { Faker::Number.number(5) }
  end

  factory :invalid_question, parent: :question do |f|
  	f.title nil
	end
end
