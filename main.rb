require_relative "lib/result_printer"
require_relative "lib/test"

puts "Добрый день! Ответьте пожалуйста честно на несколько " \
  "вопросов, чтобы узнать кое-что о себе."

current_path = File.dirname(__FILE__)
questions_path = current_path + "/data/questions.txt"
results_path = current_path + "/data/results.txt"

if !File.exists?(results_path)
  abort "Файл с результатами #{results_path} не найден"
elsif !File.exists?(questions_path)
  abort "Файл с вопросами #{questions_path} не найден"
end

test = Test.new(questions_path)
result_printer = ResultPrinter.new(results_path)

until test.finished?
  test.next_question
end

result_printer.result_print(test)
