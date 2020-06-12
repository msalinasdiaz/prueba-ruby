require 'uri'
require 'net/http'
require 'json'

def buid_web_page(url)
    url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY")
    
    http = Net::HTTP.new(url.host, url.port)
    
    request = Net::HTTP::Get.new(url)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    response = http.request(request)
    response = http.request(request)
    return JSON.parse(response.read_body)[1..20]
end

data = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY")

File.open('index.html', 'w') do |f|
    f.puts "<!DOCTYPE html>\n
    <html lang= 'en'>\n
    <head>\n
    <meta charset='UTF-8's>\n
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>\n
    <meta http-equiv='X-UA-Compatible' content='ie=edge'>\n
    <title>Document</title>\n
    </head>\n
    <body>\n"
    
    clean_data.each do |photos|
        f.puts "<img src='#{photos['url']}' alt='#{photos['title']}'>"
    end
    
    
    def photos_count = {
        'FHAZ' => 366306, 
        'RHAZ' => 1620, 
        'MAST' => 4362, 
        'CHEMCAM' => 29206, 
        'MAHLI' => 3829, 
        'MARDI' => 9182, 
        'NAVCAM' => 4782, 
        'PANCAM' => 4920, 
        'MINITES' => 482}.group_by { |camera, total_photos| camera.class total_photos.class}
        camera = {''} 
        total_photos = {''} 
        return = total_photos 
        gets.chomp "Ingrese cámara"       
    end
    print ("La cámara #{camera} tiene #{total_photos} fotos")
end



f.puts "\t</body> \n
</html>"
end
