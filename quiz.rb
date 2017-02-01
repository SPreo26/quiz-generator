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

p "Please enter the number of questions."
num_quiz_questions = gets.chomp.to_i

questions = draw_questions(questions_tree, num_quiz_questions, num_bank_questions)

questions.each do |question|
  p question
end