  class RuleController < ApplicationController
  
  @@rules = [
      [true, true, true, false],
      [false, true, true, true],
      [true, false, true, true],
      [false, false, true, false],
      [true, true, false, true],
      [false, true, false, true],
      [true, false, false, true],
      [false, false, false, false]
  ]
  
    def output
      
  
      three_thing_output = ->(left, center, right) do
          @@rules.each do |rule|
              if left == rule[0] and center == rule[1] and (right == rule[2] or (right.nil? and rule[2] == false))
                  return rule[3]
              end
          end
          return nil
      end
  
      array_output = ->(arr, i) do
          if i == 0
              return three_thing_output[false, arr[i], arr[i+1]]
          end
          three_thing_output[arr[i-1], arr[i], arr[i+1]]
      end
  
      
      @result = []
          @result << [true]
          iterations = params[:num] ? params["num"].to_i : 6
  
          iterations.times do
              current = @result.last
              temp = []
  
              current.size.times do |i|
                  temp << array_output[current, i]
              end
  
              temp << true
              @result << temp
end
      end
    end