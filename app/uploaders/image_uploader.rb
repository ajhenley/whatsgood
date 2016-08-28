class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :display do
    process :resize_to_fill => [570, 400]
  end

  
   def default_url 
       "http://res.cloudinary.com/dauczqgq9/image/upload/v1471823993/nightlife_u1wgpd.jpg"
   end
  
end