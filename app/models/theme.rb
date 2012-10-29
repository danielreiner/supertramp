class Theme < ActiveRecord::Base
  
  #include AASM, PrettyParams
  
  #acts_as_commentable
  
  has_many :cards
  has_many :contributers, :source => :user
  has_many :theme_watches
  
  belongs_to :user
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
      
  validates_presence_of :title, :message => "Bitte gib einen Titel an."
  validates_presence_of :user_id, :message => "Ein Thema kann nicht ohne einen Benutzer angelegt werden."

  scope :viewable, :conditions => "themes.state = 'published'"

  accepts_nested_attributes_for :cards

  # aasm_column :state
  # aasm_initial_state :published
  # aasm_state :published
  # aasm_state :closed
  # aasm_state :hidden

  # aasm_event :hide do
  #   transitions :from => [:published, :closed], :to => :hidden
  # end
  # aasm_event :close do
  #   transitions :from => :published, :to => :closed
  # end
  # aasm_event :reopen do
  #   transitions :from => :closed, :to => :published
  # end

  #def message_count(user)
    #return forum_messages_count unless user
    #user.admin? ? forum_messages.count : forum_messages_count
  #end

end
