class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|

    	t.references :follower_id
    	t.references :followed_id

    end

    add_foreign_key :followings, :users, column: :follower_id, primary_key: :id
    add_foreign_key :followings, :users, column: :followed_id, primary_key: :id

  end
end
