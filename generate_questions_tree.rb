def generate_questions_tree(questions_raw)

  questions_tree = []

  questions_raw.each do |question|

    matching_strand_index = questions_tree.index{|hash| hash[:strand_id] == question[0]}

    if matching_strand_index

      matching_standard_index = questions_tree[matching_strand_index][:data]
        .index{|hash| hash[:standard_id] == question[2]}

      if matching_standard_index

        questions_tree[matching_strand_index][:data][matching_standard_index][:data] << {
            question_id: question[4],
            difficulty: question[5]
          }

      else

        questions_tree[matching_strand_index][:data] << {
          standard_id: question[2],
          standard_name: question[3],
          data: [{
            question_id: question[4],
            difficulty: question[5]
          }] 
        } 

      end

    else

      questions_tree << {
        strand_id: question[0],
        strand_name: question[1],
        data: [{
          standard_id: question[2],
          standard_name: question[3],
          data: [{
            question_id: question[4],
            difficulty: question[5]
          }] 
        }]
      } 

    end

  end
  
  questions_tree

end