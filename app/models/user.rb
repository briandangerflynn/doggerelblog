class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :photo,
                    styles: {
                              thumb: '100x100>',
                              square: '200x200#',
                              medium: '300x300>'
                            },
                    bucket: :blogrflynn

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  has_many :posts



  def to_s
    if self.name
      return self.name
    else
      return "Anonymous"
    end
  end
end
