class MatchesController < ApplicationController
  def index
    @matches = Match.page(params[:page]).per(10)

    render("match_templates/index.html.erb")
  end

  def show
    @comment = Comment.new
    @match = Match.find(params.fetch("id_to_display"))

    render("match_templates/show.html.erb")
  end

  def new_form
    @match = Match.new

    render("match_templates/new_form.html.erb")
  end

  def create_row
    @match = Match.new

    @match.date = params.fetch("date")
    @match.start = params.fetch("start")
    @match.end = params.fetch("end")
    @match.sender_availability_id = params.fetch("sender_availability_id")
    @match.recipient_availability_id = params.fetch("recipient_availability_id")
    @match.state_id = params.fetch("state_id")

    if @match.valid?
      @match.save

      redirect_back(:fallback_location => "/matches", :notice => "Match created successfully.")
    else
      render("match_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_slot
    @match = Match.new

    @match.date = params.fetch("date")
    @match.start = params.fetch("start")
    @match.end = params.fetch("end")
    @match.sender_availability_id = params.fetch("sender_availability_id")
    @match.recipient_availability_id = params.fetch("recipient_availability_id")
    @match.state_id = params.fetch("state_id")

    if @match.valid?
      @match.save

      redirect_to("/slots/#{@match.sender_availability_id}", notice: "Match created successfully.")
    else
      render("match_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_slot
    @match = Match.new

    @match.date = params.fetch("date")
    @match.start = params.fetch("start")
    @match.end = params.fetch("end")
    @match.sender_availability_id = params.fetch("sender_availability_id")
    @match.recipient_availability_id = params.fetch("recipient_availability_id")
    @match.state_id = params.fetch("state_id")

    if @match.valid?
      @match.save

      redirect_to("/slots/#{@match.recipient_availability_id}", notice: "Match created successfully.")
    else
      render("match_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @match = Match.find(params.fetch("prefill_with_id"))

    render("match_templates/edit_form.html.erb")
  end

  def update_row
    @match = Match.find(params.fetch("id_to_modify"))

    @match.date = params.fetch("date")
    @match.start = params.fetch("start")
    @match.end = params.fetch("end")
    @match.sender_availability_id = params.fetch("sender_availability_id")
    @match.recipient_availability_id = params.fetch("recipient_availability_id")
    @match.state_id = params.fetch("state_id")

    if @match.valid?
      @match.save

      redirect_to("/matches/#{@match.id}", :notice => "Match updated successfully.")
    else
      render("match_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_sender_availability
    @match = Match.find(params.fetch("id_to_remove"))

    @match.destroy

    redirect_to("/slots/#{@match.sender_availability_id}", notice: "Match deleted successfully.")
  end

  def destroy_row_from_recipient_availability
    @match = Match.find(params.fetch("id_to_remove"))

    @match.destroy

    redirect_to("/slots/#{@match.recipient_availability_id}", notice: "Match deleted successfully.")
  end

  def destroy_row
    @match = Match.find(params.fetch("id_to_remove"))

    @match.destroy

    redirect_to("/matches", :notice => "Match deleted successfully.")
  end
end
