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
        @photos[antagonizer.id] = Cloudinary::Utils.cloudinary_url(antagonizer.photos[0].key, :format => :png)
      end
      @photos.each do |id, url|
        @result = FaceDetection.detect(Cloudinary::Utils.cloudinary_url(antagonizer.photos[0].key), @photo)
        if @result == "The two faces belong to the same person. "
          @matches << antagonizer
        end
      end
    end
  @matches.uniq

  end

end
