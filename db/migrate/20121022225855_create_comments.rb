class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments, :force => true do |t|
      t.integer 	:user_id
      t.string		:target_type
      t.integer 	:target_id
      t.text 		:body

      t.timestamps
    end
  end
end
