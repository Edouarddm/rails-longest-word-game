require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    alpha = ("A".."Z").to_a
    @letters = []
    10.times do
      @letters << alpha.sample
    end
  end

  def score
    @grid = params[:letters]
    @attempt = params[:attempt]
    @result = {}
  end

  def english?(attempt)
    url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    attempt_user = URI.open(url).read
    attempt_word = JSON.parse(attempt_user)
    attempt_word["found"]
  end

  def dedans?(attempt, grid)
    if @attempt.chars.all? do |letter|
      attempt.count(letter) <= grid.count(letter)
    end
  end
end
