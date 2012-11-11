class Content < ActiveRecord::Base
  
  # include PrettyParams
  
  # acts_as_commentable
  attr_accessible :user_id, :theme_id, :title, :country, :note, :position
  
  has_many :contributers, :source => :user
  
  belongs_to :theme, :counter_cache => true
  belongs_to :user
  belongs_to :category
  belongs_to :card

  alias_method :author, :user
  def author_id; user_id; end
  
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
  validates_presence_of :card_id
  validates_presence_of :category_id

  scope :viewable, :conditions => "theme.state = 'published'"

  accepts_nested_attributes_for :comment

end

