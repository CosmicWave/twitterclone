class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|

    	t.text :body

    	t.references :tweet, foreign_key: true
    	t.references :user, foreign_key: true

    	t.timestamps

    end
  end
end
