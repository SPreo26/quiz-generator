def draw_questions(questions_tree, num_questions)
  questions_tree_work_copy = []
  questions = []

  while num_questions > 0 

    if questions_tree_work_copy.empty?
      questions_tree_work_copy = questions_tree.clone
    end

    questions_tree_work_copy.each do |strand|

      strand.each do |standard|

        standard.each do |question|        

          questions << question
          num_questions -= 1
          return questions if num_questions <= 0

        end

      end

    end  

  end

  return questions

end