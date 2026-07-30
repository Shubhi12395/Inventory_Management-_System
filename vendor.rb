class Vendor
 def self.call(name, id)
    loop do puts "Enter your choice......."
    puts "1. Add new product"
    puts "2. remove product"
    puts "3. update product"
    puts "4. View all product"
    puts "5.  Exit"
    choice=gets.chomp
    case choice
         when "1"
         puts "enter details  name,category,price,quantity seprate the details by coma....."
         s=gets.chomp
         File.open("products.txt","a") do |file|
          file.syswrite("#{id},#{s}\n")
         end
         puts "product added successfully !!!!!!!!"
         puts

         when "2"
             puts "enter the name of the product"
            d=gets.chomp.downcase
            lines = File.readlines("products.txt")
              lines = File.readlines("products.txt")
                  ss=lines.select { |line| 
                     line.include?(d) }
                     
                   arr=ss[0].to_s.split(",")
                    if(arr[0]!=id)
                   puts "you can't remove this product as it is other vendor's product !!!!!"
                    next
                end
             lines.reject! { |line| 
            line.include?(d) }
             File.open("products.txt","w") { |f| f.puts(lines)}
            puts "product removed !!!!!!!!"

         when "3"
                  puts "Enter the product name for updating...."
                 u=gets.chomp.downcase
                 lines = File.readlines("products.txt")
              lines = File.readlines("products.txt")
                  ss=lines.select { |line| 
                     line.include?(u) }
                     
                   arr=ss[0].to_s.split(",")
                    if(arr[0]!=id)
                   puts "you can't update this product as it is other vendor's product !!!!!"
                    next
                end
                  lines = File.readlines("products.txt")
                  lines.reject! { |line| 
                     line.include?(u) }
                        File.open("products.txt","w") { |f| f.puts(lines)}
                        puts "Enter the category"
                        category=gets.chomp
                        puts "Enter the price"
                        price=gets.chomp
                        puts "Enter the quantity"
                        quantity=gets.chomp
                        File.open("products.txt","a") do |file|
                        file.syswrite("#{id},#{u},#{category},#{price},#{quantity}\n")
                     end
                    
            puts "product updated !!!!!!!!"
            puts 
         when "4"
            puts "Details of all the products............."
            File.open("products.txt") do |file|
                file.each_line do |line|
                 arr=line.split(",")
              if(arr[0]== id)
              puts "product name:#{arr[1]},Category:#{arr[2]},price:#{arr[3]},quantity:#{arr[4]}"   
               end
            end
        end
        puts 
      when "5"
         puts "Thankyou for visitng................."
         exit  
    end
  end
end
end