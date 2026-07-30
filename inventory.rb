require_relative 'admin'
require_relative 'customer'
require_relative  'vendor'
puts "-----------------Inventory Management System------------"
   puts "login or signup"
     c=gets.downcase
     if(c==login)
      puts "enter the name"
      sname=gets.chomp.downcase
      puts "enter the 4 digit password"
       spwd=gets.chomp
       puts "enter the role : (Vendor or Customer"
       srole=gets.chomp
     end
  puts "Enter your name for login ...."
  name= gets.chomp.downcase
  puts "Enter the 4 digit password"
  pwd=gets.chomp.to_i
  
File.open("user.csv") do |file|
    file.each_line do |line|
      
           arr=line.split(",")
        
        if(arr[1].downcase == name && arr[3].to_i==pwd)
            puts "welcome ! #{arr[1]} as #{arr[2]} ---------"

              case
              when arr[2].downcase=="admin"
                Admin.call(name, arr[0])
              when arr[2].downcase=="customer"
               Customer.call(name, arr[0])
              when arr[2].downcase== "vendor"
                Vendor.call(name, arr[0])
              end
        end  
    end
    
end