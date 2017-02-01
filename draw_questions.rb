def draw_questions(questions_tree, num_quiz_questions, num_bank_questions)

  output_questions = []

  while num_quiz_questions > 0 

    num_bank_questions_left = num_bank_questions
    questions_tree = shuffle_questions_tree(questions_tree)
    questions_tree_work_copy = deep_copy(questions_tree)#deep copy method defined here as clone/dup only makes shallow copy of an hash/array object which doesn't copy nested elements

    lambda = -> do
      while num_bank_questions_left > 0

        questions_tree_work_copy.each_with_index do |strand, strand_index|
          standards = strand[:data]

          standards.each_with_index do |standard, standard_index|
            questions = standard[:data]
            if questions.any?#make sure a nil value is never popped and added to output questions array
              output_questions << questions.pop
              questions_tree_work_copy[strand_index][:data][standard_index][:data] = questions
              num_bank_questions_left -= 1
              num_quiz_questions -= 1

              return if num_bank_questions_left <= 0
              return if num_quiz_questions <= 0 

            end
          end

        end

      end 
    end

    lambda.call

  end

  return output_questions

end

def shuffle_questions_tree(questions_tree)

  questions_tree = questions_tree.shuffle

  questions_tree.each_with_index do |strand, strand_index|

    standards = strand[:data].shuffle
    questions_tree[strand_index][:data] = standards

    standards.each_with_index do |standard, standard_index|
    
      questions = standard[:data].shuffle
      questions_tree[strand_index][:data][standard_index][:data] = questions

    end

  end

  return questions_tree  

end

def deep_copy(o)
  Marshal.load(Marshal.dump(o))
end