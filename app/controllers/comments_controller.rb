class CommentsController < ApplicationController
  before_action :current_user_must_be_comment_author, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_comment_author
    comment = Comment.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == comment.author
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.comments.ransack(params[:q])
    @comments = @q.result(:distinct => true).includes(:author, :match).page(params[:page]).per(10)

    render("comment_templates/index.html.erb")
  end

  def show
    @comment = Comment.find(params.fetch("id_to_display"))

    render("comment_templates/show.html.erb")
  end

  def new_form
    @comment = Comment.new

    render("comment_templates/new_form.html.erb")
  end

  def create_row
    @comment = Comment.new

    @comment.match_id = params.fetch("match_id")
    @comment.author_id = params.fetch("author_id")
    @comment.body = params.fetch("body")

    if @comment.valid?
      @comment.save

      redirect_back(:fallback_location => "/comments", :notice => "Comment created successfully.")
    else
      render("comment_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_match
    @comment = Comment.new

    @comment.match_id = params.fetch("match_id")
    @comment.author_id = params.fetch("author_id")
    @comment.body = params.fetch("body")

    if @comment.valid?
      @comment.save

      redirect_to("/matches/#{@comment.match_id}", notice: "Comment created successfully.")
    else
      render("comment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @comment = Comment.find(params.fetch("prefill_with_id"))

    render("comment_templates/edit_form.html.erb")
  end

  def update_row
    @comment = Comment.find(params.fetch("id_to_modify"))

    @comment.match_id = params.fetch("match_id")
    
    @comment.body = params.fetch("body")

    if @comment.valid?
      @comment.save

      redirect_to("/comments/#{@comment.id}", :notice => "Comment updated successfully.")
    else
      render("comment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_author
    @comment = Comment.find(params.fetch("id_to_remove"))

    @comment.destroy

    redirect_to("/users/#{@comment.author_id}", notice: "Comment deleted successfully.")
  end

  def destroy_row_from_match
    @comment = Comment.find(params.fetch("id_to_remove"))

    @comment.destroy

    redirect_to("/matches/#{@comment.match_id}", notice: "Comment deleted successfully.")
  end

  def destroy_row
    @comment = Comment.find(params.fetch("id_to_remove"))

    @comment.destroy

    redirect_to("/comments", :notice => "Comment deleted successfully.")
  end
end
