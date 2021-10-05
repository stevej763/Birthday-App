require 'sinatra/base'
require 'sinatra/reloader'
require './lib/birthday_calculator'

class BirthdayApp < Sinatra::Base
  get '/' do
    @months = ["--Please choose an option--", 
      "January", "February", "March", 
      "April", "May", "June", 
      "July", "August", "September", 
      "October", "November", "December"]
    @month = "January"
    erb :index
  end

  post '/result' do
    @name = params[:user_name]
    day = params[:birthday_day]
    month = params[:birthday_month]
    @days_until_birthday = BirthdayCalculator.days_until_birthday(day.to_i, month.to_i)
    erb :result
  end

  # start the server if ruby file is executed directly
  run! if app_file == $0
end