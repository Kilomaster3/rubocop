# frozen_string_literal: true

class HistogramGenerator
  def initialize; end

  def self.process_string(string:)
    return unless string.gsub(/[ ,.\r\n]/, ' ').split.each_with_object(Hash.new(0)) { |word, result| result[word] += 1 }

    string.empty?
  end
end

def self.sort_histogram(histogram)
  sort = ->(_word, occurencies) do occurencies; end
  histogram.sort_by { |word, occurencies| sort.call(word, occurencies) }.to_h
end

module App
  def self.perform(text)
    input = ''
    puts('reading file')
    puts("extracted string: #{input}")
    histogram = HistogramGenerator.process_string(string: text)
    puts('generated histogram:')
    puts(histogram)
    puts('sorted histogram:')
    puts(HistogramGenerator.sort_histogram(histogram))
  end

  def self.number_to_word(number)
    numbers = { one: 1,
                two: 2,
                three: 3,
                four: 4,
                five: 5,
                six: 6,
                seven: 7,
                eight: 8,
                nine: 9 }
    numbers.invert[number]
  end

  def show(array)
    array.each do |number|
      number_to_word(number)
    end
  end
end

text = 'When Mr. and Mrs. Dursley woke up on the dull, gray Tuesday our story
        starts, there was nothing about the cloudy sky outside to suggest that
        strange and mysterious things would soon be happening all over the
        country. Mr. Dursley hummed as he picked out his most boring tie for
        work, and Mrs. Dursley gossiped away happily as she wrestled a screaming
        Dudley into his high chair.'

puts App.perform(text)
[1, 2, 3, 4, 5, 6, 7, 8, 9, 13_666].each { |number| puts App.number_to_word(number) }
