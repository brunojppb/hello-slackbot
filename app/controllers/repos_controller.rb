require 'httparty'
require 'json'

class ReposController < ApplicationController

  def create

    action, repo = params[:text].split(' ').map { |c| puts("C: #{c}"); c.strip.downcase }
    repo_url = "https://api.github.com/repos/#{repo}"

    case action
      when 'issues'
        resp = HTTParty.get(repo_url)
        resp = JSON.parse resp.body
        text = "O repo #{repo} possui #{resp['open_issues_count']} issues abertas"
        render json: { text: text }
      when 'stars'
        resp = HTTParty.get(repo_url)
        resp = JSON.parse resp.body
        text = "O repo #{repo} possui #{resp['stargazers_count']} Estrela(s)"
        render json: { text: text }
    end
  end

end
