class ResultPrinter
  def initialize(results_path)
    @results = File.readlines(results_path, encoding: "UTF-8")
  end

  def result_print(test)
    puts
    puts
    puts "Результат теста (всего баллов - #{test.score}):"

    case test.score
    when (32..30) then puts @results[0]
    when (25..29) then puts @results[1]
    when (19..24) then puts @results[2]
    when (14..18) then puts @results[3]
    when (9..13)  then puts @results[4]
    when (4..9)   then puts @results[5]
    else
      puts @results[6]
    end
  end
end
