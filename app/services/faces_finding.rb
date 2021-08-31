class FacesFinding
  def initialize(photo)
    @photo = photo
  end

  def call
    @antagonizers = Antagonizer.all
    @photos = {}
    @matches = []
    @antagonizers.each do |antagonizer|
      if antagonizer.photos.attached?
        # @photos[antagonizer.id] = Cloudinary::Utils.cloudinary_url(antagonizer.photos[0].key, :format => :png)
        antagonizer.photos.each do |photo|
        @result = FaceDetection.detect(Cloudinary::Utils.cloudinary_url(photo.key), @photo)
          if @result == "The two faces belong to the same person. "
            @matches << antagonizer
            break
          end
        end
      end

    end
  @matches

  end

end
