module Articles
  class Import < Base
    def initialize()
    end

    def import  
      response = get(url: "/")

      response.success? ? register_articles(JSON.parse(response.body)) : nil
    end

    private 

    def register_articles(articles)
      articles.each do |article|
        new_article = Article.new(
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

        new_article.save
      end
    end
  end
end