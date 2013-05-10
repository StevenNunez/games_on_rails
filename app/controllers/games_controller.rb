class GamesController < ApplicationController
  def index
    @time = Time.now
    @games = {
      "Magic 8 Ball" => magic_8_ball_path,
      "Secret Number" => secret_number_path
    }
  end

  def magic_8_ball

  end

  def magic_8_ball_play
    @question = params["question"].humanize
    fortunes = ["It is certain", "It is decidedly so", "Without a doubt", "Yes definitely",
     "You may rely on it", "As I see it yes", "Most likely", "Outlook good",
     "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later",
     "Better not tell you now", "Cannot predict now", "Concentrate and ask again",
     "Don't count on it", "My reply is no", "My sources say no",
     "Outlook not so good", "Very doubtful"]
     @answer = fortunes.sample
   end

   def secret_number
   end

   def rock_paper_scissors_play
    rps = {
      "rock" => "scissors",
      "scissor" => "paper",
      "paper" => "rock"
    }
    @your_throw = params[:throw]
    @rails_throw = ["rock", "paper", "scissors"].sample
    if @your_throw == @rails_throw
      @status = "Tie!"
    elsif rps[@your_throw] == @rails_throw
      @status = "Win"
    else
      @status = "Lose"
    end
  end

  def secret_number_play
    @guess = params[:guess].to_i
    @answer = rand(10) + 1
    if @guess == @answer
      render "win"
    else
      redirect_to "http://www.youtube.com/watch?v=oHg5SJYRHA0"
    end
  end
end
