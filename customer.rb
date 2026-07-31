class Customer
 def self.call(name, id)
    loop do 
    puts "Enter your choice......."
    puts "1. browse product"
    puts "2. view order history"
    puts "3. place an order"
    puts "4. Exit"

    choice=gets.chomp
        case choice
         when "1"
            puts "Enter the choice"
            puts "1.View all product"
            puts "2 Browse by Category"
            puts "3.Search the particular product"
            
            ch=gets.chomp
            case ch
            when "1"
               puts "Details of all the product...."
               File.open("products.txt") do |file|
              file.each_line do |line|
               arr=line.split(",")
               print "product name: #{arr[1]}......."
                print "price: #{arr[3]}/ Rs."
                puts 
               end
              end
            when "2"
               puts "Enter the category: electronics,food.."
            c=gets.chomp.downcase
           puts "Details of all the product............."
            File.open("products.txt") do |file|
              file.each_line do |line|
               arr=line.split(",")
               if(arr[2].downcase==c)
                print "product name: #{arr[1]}......."
                print "price: #{arr[3]}/ Rs."
                puts 
               end
               end
            end
              when "3"
               puts "Enter the product"
            c=gets.chomp.downcase
           puts "Details of the product............."
            File.open("products.txt") do |file|
              file.each_line do |line|
               arr=line.split(",")
               if(arr[1].downcase==c)
                print "product name: #{arr[1]}......."
                print "price: #{arr[3]}/ Rs."
                puts 
               end
               end
            end
         end
            puts 
         when "2" 
               puts "Details of all the orders............."
            File.open("orders.txt") do |file|
                file.each_line do |line|
                 arr=line.split(",")
              if(arr[1]== id)
                puts "product name: #{arr[3]} order id is: #{arr[0]} quantity: #{arr[4]} on #{arr[5]}"
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
               if(num==0)
                  puts "product is out of stock"
                 elsif(num-quantity <0 ||num-quantity >0 || num-quantity ==0)
                       if(num-quantity<0) 
                           puts "#{num} #{pname} are available now"
                           puts "you want to order the product? yes or no"
                           t=gets.chomp
                           if(t.downcase=="no")
                            next
                           end
                        end
                        if(num-quantity<0)
                           arr[4]="0"
                           quantity=num
                        else
                        arr[4]="#{num-quantity}"
                        end
                         lines = File.readlines("products.txt")
                        lines.reject! { |line| 
                     line.include?(pname) }
                     File.open("products.txt","w") { |f| f.puts(lines)}
                     File.open("products.txt","a") do |file|
                     file.syswrite("#{arr[0]},#{arr[1]},#{arr[2]},#{arr[3]},#{arr[4]}\n")
                     end
                     File.open("orders.txt","a+") do |file|
                      i=0
                        file.each_line do |line|
                           i+=1
                        end
                        file.syswrite("#{i+101},")

                              end
                              puts "product name:#{pname}, quantity:#{quantity}, total amount is:#{quantity*arr[3].to_i} Rs."
                      File.open("orders.txt","a") do |file|
                        time=Time.new
                     file.syswrite("#{id},#{name},#{pname},#{quantity},#{time.strftime("%Y-%m-%d %H:%M:%S")
}\n")                 
                       
                     end
                      
                     puts "Your order is placed..............."
                     puts 
               end
         when "4"
            puts "Thankyou for visiting........"
            Inventory.login
         end
        end
  end        
end