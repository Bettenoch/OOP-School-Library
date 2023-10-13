require './app'

def main
  app = App.new
  app.welcome
  loop do
    app.list_options
    option = gets.chomp
    if option == '7'
      app.quit_app
    else
      app.choose_option(option)
    end
  end
end

main
