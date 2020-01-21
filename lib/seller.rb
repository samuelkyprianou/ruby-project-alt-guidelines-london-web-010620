class Seller < ActiveRecord::Base
    has_many :shoes

    
    def create_account
        puts "Please specify your username"
        input = gets.chomp
        existing_user = Seller.find_by(name: input)
        if existing_user == nil
            Seller.create(name: input)
            puts "Account has been successfully created under #{input}"
        else
            puts "Sorry this Username is taken, please try again."
            create_account
        end 
    end 
    
    def delete_account
        puts "To confirm you would like to delete your account, please specify your username."
        input = gets.chomp
        existing_user = Seller.find_by(name: input)
        if !existing_user
            puts "User does not exist"
        else
            existing_user.destroy
            puts "Your account has been successfully deleted, many thanks for using our platform."
    end
end
end






