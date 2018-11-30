Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "slots#index"
  # Routes for the Comment resource:

  # CREATE
  get("/comments/new", { :controller => "comments", :action => "new_form" })
  post("/create_comment", { :controller => "comments", :action => "create_row" })

  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  get("/comments/:id_to_display", { :controller => "comments", :action => "show" })

  # UPDATE
  get("/comments/:prefill_with_id/edit", { :controller => "comments", :action => "edit_form" })
  post("/update_comment/:id_to_modify", { :controller => "comments", :action => "update_row" })

  # DELETE
  get("/delete_comment/:id_to_remove", { :controller => "comments", :action => "destroy_row" })
  get("/delete_comment_from_match/:id_to_remove", { :controller => "comments", :action => "destroy_row_from_match" })
  get("/delete_comment_from_author/:id_to_remove", { :controller => "comments", :action => "destroy_row_from_author" })

  #------------------------------

  # Routes for the State resource:

  # CREATE
  get("/states/new", { :controller => "states", :action => "new_form" })
  post("/create_state", { :controller => "states", :action => "create_row" })

  # READ
  get("/states", { :controller => "states", :action => "index" })
  get("/states/:id_to_display", { :controller => "states", :action => "show" })

  # UPDATE
  get("/states/:prefill_with_id/edit", { :controller => "states", :action => "edit_form" })
  post("/update_state/:id_to_modify", { :controller => "states", :action => "update_row" })

  # DELETE
  get("/delete_state/:id_to_remove", { :controller => "states", :action => "destroy_row" })

  #------------------------------

  # Routes for the Match resource:

  # CREATE
  get("/matches/new", { :controller => "matches", :action => "new_form" })
  post("/create_match", { :controller => "matches", :action => "create_row" })

  # READ
  get("/matches", { :controller => "matches", :action => "index" })
  get("/matches/:id_to_display", { :controller => "matches", :action => "show" })

  # UPDATE
  get("/matches/:prefill_with_id/edit", { :controller => "matches", :action => "edit_form" })
  post("/update_match/:id_to_modify", { :controller => "matches", :action => "update_row" })

  # DELETE
  get("/delete_match/:id_to_remove", { :controller => "matches", :action => "destroy_row" })
  get("/delete_match_from_recipient_availability/:id_to_remove", { :controller => "matches", :action => "destroy_row_from_recipient_availability" })
  get("/delete_match_from_sender_availability/:id_to_remove", { :controller => "matches", :action => "destroy_row_from_sender_availability" })

  #------------------------------

  # Routes for the Slot resource:

  # CREATE
  get("/slots/new", { :controller => "slots", :action => "new_form" })
  post("/create_slot", { :controller => "slots", :action => "create_row" })

  # READ
  get("/slots", { :controller => "slots", :action => "index" })
  get("/slots/:id_to_display", { :controller => "slots", :action => "show" })

  # UPDATE
  get("/slots/:prefill_with_id/edit", { :controller => "slots", :action => "edit_form" })
  post("/update_slot/:id_to_modify", { :controller => "slots", :action => "update_row" })

  # DELETE
  get("/delete_slot/:id_to_remove", { :controller => "slots", :action => "destroy_row" })
  get("/delete_slot_from_user/:id_to_remove", { :controller => "slots", :action => "destroy_row_from_user" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
