class SessionsController < ApplicationController
  skip_before_action :authenticate

  def login
  end

  def logout
  end
end
