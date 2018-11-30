class SlotsController < ApplicationController
  before_action :current_user_must_be_slot_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_slot_user
    slot = Slot.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == slot.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.slots.ransack(params[:q])
    @slots = @q.result(:distinct => true).includes(:user, :sent_matches, :recipient_matches).page(params[:page]).per(10)

    render("slot_templates/index.html.erb")
  end

  def show
    @match = Match.new
    @slot = Slot.find(params.fetch("id_to_display"))

    render("slot_templates/show.html.erb")
  end

  def new_form
    @slot = Slot.new

    render("slot_templates/new_form.html.erb")
  end

  def create_row
    @slot = Slot.new

    @slot.user_id = params.fetch("user_id")
    @slot.date = params.fetch("date")
    @slot.start_time = params.fetch("start_time")
    @slot.end_time = params.fetch("end_time")

    if @slot.valid?
      @slot.save

      redirect_back(:fallback_location => "/slots", :notice => "Slot created successfully.")
    else
      render("slot_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @slot = Slot.find(params.fetch("prefill_with_id"))

    render("slot_templates/edit_form.html.erb")
  end

  def update_row
    @slot = Slot.find(params.fetch("id_to_modify"))

    
    @slot.date = params.fetch("date")
    @slot.start_time = params.fetch("start_time")
    @slot.end_time = params.fetch("end_time")

    if @slot.valid?
      @slot.save

      redirect_to("/slots/#{@slot.id}", :notice => "Slot updated successfully.")
    else
      render("slot_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @slot = Slot.find(params.fetch("id_to_remove"))

    @slot.destroy

    redirect_to("/users/#{@slot.user_id}", notice: "Slot deleted successfully.")
  end

  def destroy_row
    @slot = Slot.find(params.fetch("id_to_remove"))

    @slot.destroy

    redirect_to("/slots", :notice => "Slot deleted successfully.")
  end
end
