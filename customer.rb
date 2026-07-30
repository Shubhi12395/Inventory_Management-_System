class Customer
 def self.call(name, id)
    loop do 
    puts "Enter your choice......."
    puts "1. browse product"
    puts "2. view order histroy"
    puts "3. place an order"
    puts "4. Exit"

    choice=gets.chomp
        case choice
         when "1"
           puts "Details of all the products............."
            File.open("products.txt") do |file|
              file.each_line do |line|
               arr=line.split(",")
                print "product name: #{arr[1]}......."
                print "price: #{arr[3]}/ Rs."
                puts 
                
               end
            end 
            puts 
         when "2" 
               puts "Details of all the orders............."
            File.open("orders.txt") do |file|
                file.each_line do |line|
                 arr=line.split(",")
              if(arr[1]== name)
                puts "product name: #{arr[2]} and quantity: #{arr[3]}"
               end
            end
        end
        puts 
         when "3"
            puts "Enter the name of the product"
            pname=gets.chomp
            puts "Enter the quantity"
            quantity=gets.chomp.to_i
            lines = File.readlines("products.txt")
                  ss=lines.select { |line| 
                     line.include?(pname) }
                     
               arr=ss[0].to_s.split(",")
               num=arr[4].to_i
               if(num-quantity <=0)
                    puts "Sorry! this product is out of stock"
                    puts "Browse the other products"
                    next
                    else
                        arr[4]="#{num-quantity}"
                         lines = File.readlines("products.txt")
                   lines.reject! { |line| 
                     line.include?(pname) }
                     File.open("products.txt","w") { |f| f.puts(lines)}
                     File.open("products.txt","a") do |file|
                     file.syswrite("#{arr[0]},#{arr[1]},#{arr[2]},#{arr[3]},#{arr[4]}\n")
                     end
                      File.open("orders.txt","a") do |file|
                     file.syswrite("#{id},#{name},#{pname},#{arr[4]}\n")
                     end
                      
                     puts "Your order is placed..............."
               end
         when "4"
            puts "Thankyou for visiting........"
            exit
         end
        end
  end        
end