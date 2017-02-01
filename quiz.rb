require_relative "generate_questions_tree.rb"
require_relative "draw_questions.rb"

questions_raw = []


File.open("questions.csv", "r") do |f|
  f.each_line.with_index do |line, index|
    next if index == 0
    questions_raw << line.chomp.split(",")
  end
end

num_bank_questions = questions_raw.length

questions_tree = generate_questions_tree(questions_raw)
#questions are classified in a JSON-like nested array/hash tree to help with evenly drawing from each strand and standard

num_quiz_questions = 0
while num_quiz_questions <=0
  p "Please enter the number of questions (greater than 0)."
  num_quiz_questions = gets.chomp.to_i
end

questions = draw_questions(questions_tree, num_quiz_questions, num_bank_questions)

p questions.map{|q| q[:question_id]}.join(", ")