module Articles
  class ImportJob < ApplicationJob
    queue_as :default

    def perform 
      import_articles
    end

    private

    def import_articles
      Articles::Import.new().import
    end
  end
end