class FacesFinding
  def initialize(antagonizer)
    @antagonizer = antagonizer
  end

  def call
    @antagonizers = Antagonizer.where.not(id: @antagonizer)
    @photos = {}
    @antagonizers.each do |antagonizer|
      if antagonizer.photos.attached?
        @photos[antagonizer.id] = Cloudinary::Utils.cloudinary_url(antagonizer.photos[0].key, :format => :png)
      end
      @photos.each do |id, url|
        @result = FaceDetection.detect(Cloudinary::Utils.cloudinary_url(antagonizer.photos[0].key), url)
        if @result == "The two faces belong to the same person. "
          return id
        end
      end
    end


  end

end
