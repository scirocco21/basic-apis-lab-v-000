class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params[:q] = query
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      end
      render 'search'
    end
  end
end
