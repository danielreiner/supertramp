class Card < ActiveRecord::Base
  
  # include PrettyParams
  
  # acts_as_commentable
  
  has_many :categories
  has_many :contents
  has_many :contributers, :source => :user
  
  belongs_to :creator, :class_name => "User"
  belongs_to :theme, :counter_cache => true
  
  # has_attached_file :image,
  #     :default_url => "/images/#{I18n.t(:app).downcase}/b-userpic/noavatar-:style.jpg",
  #     :path => "public/uploads/:class/:attachment/:id_partition/:style/:basename.:extension",
  #     :url => "/uploads/:class/:attachment/:id_partition/:style/:basename.:extension",
  #     :default_style => :medium,
  #     :styles => {
  #       :original => "600x600>",
  #       :medium => "140x140#", 
  #       :teaser => "64x64#",
  #       :game   => "48x48#", 
  #       :forum  => "32x32#",
  #       :chat   => "24x24#",
  #       :tiny   => "16x16#"
  #     }
      
  validates_presence_of :title
  validates_presence_of :user_id
  validates_presence_of :theme_id

end
