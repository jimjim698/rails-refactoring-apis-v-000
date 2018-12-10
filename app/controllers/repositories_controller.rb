class RepositoriesController < ApplicationController
  def index
    repos = GithubService.new
    @repos_array = repos.get_repos(session[:token])
  end

  def create
    @name = params[:name]
    repos = GithubService.new
    repos.create_repo(session[:token], @name)
    redirect_to '/'
  end
end
