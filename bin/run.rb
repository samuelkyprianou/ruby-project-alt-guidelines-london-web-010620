require_relative "../config/environment"
system "clear"
quit = false
pid = fork { exec "afplay", "lib/soundfile/Welcome.mp3" }
cli = CommandLineInterface.new
brand = Brand.new
shoe = Shoe.new
seller = Seller.new
cli.greet
while quit == false
    prompt = TTY::Prompt.new
          menu_options = ["Search by Brand Name", "Search by Price Range", "Create new Seller Account", "Login", "Exit"]
          menu = prompt.select("Select one of the options below:", menu_options, filter: true)
    case menu

    when "Search by Brand Name"
    system "clear"
    brand.brand_search
    when "Search by Price Range"
    system "clear"
    shoe.price_range
    when "Create new Seller Account"
    system "clear"
    seller.create_account
    when "Login"
    seller.login
    when "Exit"
    quit = true
    system "clear"
    cli.goodbye
    sleep(3)
    system "clear"
  end
end
