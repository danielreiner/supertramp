class CreateQuartetts < ActiveRecord::Migration
  def self.up
		create_table :themes do |t|
		  t.integer   :user_id
		  t.string    :title
		  t.text      :description
		  t.string    :image_file_name
		  t.string    :state, default => 'in_progress'
		  t.boolean   :public, :null => false, :default => true
		  t.integer   :position
		  t.integer   :cards_count, default => 0
		  t.timestamps
		end

		create_table :cards do |t|
		  t.integer   :user_id
		  t.integer   :theme_id
		  t.string    :title
		  t.string    :country
		  t.text      :note
		  t.integer   :position
		  t.integer   :categories_count, default => 0
		  t.timestamps
		end

		create_tabel :images do |t|
		  t.integer   :user_id
		  t.integer   :theme_id
		  t.integer   :cards_id
		  t.string    :image_file_name
		  t.string    :title
		  t.string    :origin
		  t.text      :note
		  t.integer   :position
		  t.timestamps
		end

	  create_table :categories do |t|
	    t.integer   :user_id
    	t.integer   :theme_id
    	t.integer   :card_id
    	t.string    :title
    	t.text      :note
    	t.integer   :position
    	t.integer   :contents_count, default => 0
    	t.timestamps
	  end
	  
	  create_table :contents do |t|
	    t.integer   :user_id
    	t.integer   :theme_id
    	t.integer   :card_id
    	t.integer   :category_id
    	t.string    :title
    	t.text      :note
	    t.integer   :position
      t.timestamps
	  end
	end
	
	def self.down
	  drop_table :themes
	  drop_table :cards
	  drop_table :images
	  drop_table :categories
	  drop_table :contents
	end
end
