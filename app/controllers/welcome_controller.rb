class WelcomeController < ApplicationController
  def index
    render component: 'Welcome'
  end
end
