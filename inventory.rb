require_relative 'admin'
require_relative 'customer'
require_relative  'vendor'
class Inventory
     def self.signup
      puts "-----------------Inventory Management System------------"
      puts "login or signup"
      c=gets.downcase.strip
      if(c=="signup")
      puts "enter the name"
      sname=gets.chomp.downcase
      puts "enter the 4 digit password"
       spwd=gets.chomp.downcase
       puts "enter the role : (Vendor or Customer)"
       srole=gets.chomp.downcase
      
       File.open("user.csv","a+") do |file|
        i=0
        file.each_line do |line|
          i+=1
        end
                   file.syswrite("#{i+1},")

         end
       File.open("user.csv","a") do |file|
          file.syswrite("#{sname},#{srole},#{spwd}\n")
         end
       Inventory.login
        else
        Inventory.login
        end
    end
   def self.login
    $r=0
    3.times do
   $r+= 1
  puts "Enter your name for login ...."
  name= gets.chomp.downcase
  puts "Enter the 4 digit password"
  pwd=gets.chomp
  
    if($r>=3 && name.strip.empty? && pwd.strip.empty?)
      puts "three attemps failed"
      exit
    end
  
  redo if ((name.strip.empty? && pwd.strip.empty?) &&  $r <3)
 pwd=pwd.to_i
  

File.open("user.csv") do |file|
    file.each_line do |line|
      
           arr=line.split(",")
        if(arr[1].downcase == name && arr[3].to_i==pwd)
            puts "successfully logged in ...."
            puts
            puts "welcome ! #{arr[1]} as #{arr[2]} ---------"

              case
              when arr[2].downcase=="admin"
                Admin.call(name, arr[0])
              when arr[2].downcase=="customer"
               Customer.call(name, arr[0])
               exit
              when arr[2].downcase== "vendor"
                Vendor.call(name, arr[0]) 
              end
        end  
      end
      puts "invalid user name and password !!!!!!"
      
    end
    
    end
  end
end
Inventory.signup
