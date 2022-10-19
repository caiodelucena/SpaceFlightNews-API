module Articles
  class Base
    URL_BASE = "https://api.spaceflightnewsapi.net/v3/articles"

    def get(url:, body: nil)
      HTTParty.get(
        mount_url_request(url),
        :headers => headers,
        :body    => body.to_json
      )
    end

    private

    def headers
      {
        "Content-Type" => "application/json",
        "Accept"       => "application/json"
      }
    end

    def mount_url_request(url)
      "#{URL_BASE}#{url}"
    end
  end
end