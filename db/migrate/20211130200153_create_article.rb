class CreateArticle < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.boolean :featured
      t.string :title
      t.string :url
      t.string :imageUrl
      t.string :newsSite
      t.string :summary
      t.string :publishedAt
      t.json :launches
      t.json :events

    end
  end
end
