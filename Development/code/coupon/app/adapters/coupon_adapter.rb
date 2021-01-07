module BlipCoupons
    
  class Adapter
      
    require 'uri'
    require 'net/http'
    require 'openssl'
    require 'pry'

    

      def fetch_coupons

        url = URI("https://kuponiko.p.rapidapi.com/recent/US")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = '386b6033a1msh6f44efb8b0cf85ep163d4ejsn9eb088a488a1'
        request["x-rapidapi-host"] = 'kuponiko.p.rapidapi.com'
        response = http.request(request)
        coupon = JSON.parse(response.read_body)
        coupon.each do |x|
        @response = Coupon.create(description: x["description"], code: x["code"], store_name: x["store_name"] )
        end 
         
                    
      end 
  end 
end                 
    
    

