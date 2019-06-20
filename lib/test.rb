class Test
  attr_reader :current_question, :trick_questions, :score, :user_input
  def initialize(questions_path)
    @questions = File.readlines(questions_path, encoding: "UTF-8")
    @user_input = nil
    @score = 0
    @current_question = 0
    @trick_questions = [5, 10, 11]
  end

  def finished?
    @current_question >= @questions.size
  end

  def get_user_choice(user_input)
    until user_input == 1 || user_input == 2 || user_input == 3
      puts "Введите ваш ответ: 1 если ДА, 2 если ИНОГДА и 3 если НЕТ"
      user_input = STDIN.gets.to_i
    end
    user_input
  end

  def add_user_score(user_input)
    if (user_input == 1 && !trick_questions.include?(current_question + 1)) ||
      (user_input == 3 && trick_questions.include?(current_question + 1))
      @score += 2
    elsif user_input == 2
      @score += 1
    end
  end

  def next_question
    puts @questions[@current_question]
    puts ""

    add_user_score(get_user_choice(user_input))

    @current_question += 1
  end
end
