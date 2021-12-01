require 'rest-client'
require 'json'
namespace :import_db do
  task sync: :environment do

    resp = RestClient.get "https://api.spaceflightnewsapi.net/v3/articles"

    @articles = JSON.parse(resp.body)
      
    @articles.each do |article|
      @update_article = Article.new(
        id: article['id'],
        featured: article['featured'],
        title: article['title'],
        url: article['url'],
        imageUrl: article['imageUrl'],
        newsSite: article['newsSite'],
        summary: article['summary'],
        publishedAt: article['publishedAt'],
        launches: article['launches'],
        events: article['events']
      )

      @update_article.save
    end
  end
end