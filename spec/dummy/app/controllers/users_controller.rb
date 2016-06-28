#encoding: utf-8
class UsersController < ApplicationController

  def index
    js user_name: 'Neo'
    js user_id: 11
  end

  def new
  end

end
