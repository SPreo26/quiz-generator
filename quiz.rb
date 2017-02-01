require_relative "generate_quetions_tree.rb"
require_relative "draw_quetions.rb"

questions_raw = []

File.open("questions.csv", "r") do |f|
  f.each_line.with_index do |line, index|
    next if index == 0
    questions_raw << line.chomp.split(",")
  end
end

questions_tree = generate_questions_tree(questions_raw)

p "Please enter the number of questions."
num_questions = gets.chomp.to_i

questions = draw_quetions(questions_tree, num_questions)



