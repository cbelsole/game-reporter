class WelcomeController < ApplicationController
  def index
    render component: 'Welcome'
  end

  def about
  end
end
