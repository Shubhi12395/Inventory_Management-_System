class Admin
    def self.call(name, id)
 loop do 
    puts "Enter your choice......."
    puts "1. View all vendors and their product"
    puts "2. view all the orders"
    puts "3. Add new product"
    puts "4. Remove the product"
    puts "5. update the stock quantity"
    puts "6. view full system summary"
    puts "7. Exit"
    
    choice=gets.chomp
        case choice
        when "1"
            puts "Details of all the products and vendors............."
            File.open("products.txt") do |file|
                file.each_line do |line|
                 arr=line.split(",")
                puts line
               end
            end
        puts 
        when "2"    
            puts "Details of all the orders............."
            File.open("orders.txt") do |file|
                file.each_line do |line|
                 puts line
            end
        end
        when "3"
         puts "enter details vendor id,name,category,price,quantity seprate the details by coma....."
         s=gets.chomp
         File.open("products.txt","a") do |file|
          file.syswrite("#{s}\n")
         end
         puts "product added successfully !!!!!!!!"
         puts
        when "4"
            puts "enter the name of the product"
            d=gets.chomp.downcase
            lines = File.readlines("products.txt")

             lines.reject! { |line| 
            line.include?(d) }
             File.open("products.txt","w") { |f| f.puts(lines)}
            puts "product removed !!!!!!!!"
            puts
        when "5"
            puts "Enter the name of the product"
            pname=gets.chomp
            puts "Enter the quantity"
            quantity=gets.chomp.to_i
            lines = File.readlines("products.txt")
                  ss=lines.select { |line| 
                     line.include?(pname) }
                     
               arr=ss[0].to_s.split(",")
               num=arr[4].to_i
                arr[4]="#{num+quantity}"
            lines = File.readlines("products.txt")
                   lines.reject! { |line| 
                     line.include?(pname) }
                     File.open("products.txt","w") { |f| f.puts(lines)}
                     File.open("products.txt","a") do |file|
                     file.syswrite("#{arr[0]},#{arr[1]},#{arr[2]},#{arr[3]},#{arr[4]}\n")
                     puts "product quantity is updated"
               end
        when "6"
            puts "list of vendors and customers ..........."
            lines = File.readlines("user.csv")
                    File.open("user.csv") do |file|
                file.each_line do |line|
                puts line
               end
            end
            puts 
           puts "Details of all the products ............."
            File.open("products.txt") do |file|
                file.each_line do |line|
                puts line
               end
            end
        puts 
          puts "Details of all the orders............."
            File.open("orders.txt") do |file|
                file.each_line do |line|
                 puts line
            end
        end
        puts
        when "7"        
            exit
        end
    end   
  end
end