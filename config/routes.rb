Rails.application.routes.draw do
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

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
