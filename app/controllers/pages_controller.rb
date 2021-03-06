# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    if user_signed_in?
      @post = Post.new
      @comment = Comment.new
      ids = current_user.friends_ids
      ids << current_user.id
      @posts = Post.where("user_id IN (#{ids.join(', ')})").order(:id).reverse_order
      render 'timeline'
    else
      render 'index'
    end
  end
end
