class PostsController < ApplicationController
  require 'wikipedia'
  Wikipedia.Configure {
    domain 'ja.wikipedia.org'
    path   'w/api.php'
  }
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
    @page = Wikipedia.find('ベネチア')
  end

end
