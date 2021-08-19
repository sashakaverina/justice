
@antagonizer = Antagonizer.find(3)
puts Cloudinary::Utils.cloudinary_url(@antagonizer.photos)
