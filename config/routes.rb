Rails.application.routes.draw do
  # Routes for the Item resource:

  # CREATE
  get("/items/new", { :controller => "items", :action => "new_form" })
  post("/create_item", { :controller => "items", :action => "create_row" })

  # READ
  get("/items", { :controller => "items", :action => "index" })
  get("/items/:id_to_display", { :controller => "items", :action => "show" })

  # UPDATE
  get("/items/:prefill_with_id/edit", { :controller => "items", :action => "edit_form" })
  post("/update_item/:id_to_modify", { :controller => "items", :action => "update_row" })

  # DELETE
  get("/delete_item/:id_to_remove", { :controller => "items", :action => "destroy_row" })

  #------------------------------

  # Routes for the Restaurant resource:

  # CREATE
  get("/restaurants/new", { :controller => "restaurants", :action => "new_form" })
  post("/create_restaurant", { :controller => "restaurants", :action => "create_row" })

  # READ
  get("/restaurants", { :controller => "restaurants", :action => "index" })
  get("/restaurants/:id_to_display", { :controller => "restaurants", :action => "show" })

  # UPDATE
  get("/restaurants/:prefill_with_id/edit", { :controller => "restaurants", :action => "edit_form" })
  post("/update_restaurant/:id_to_modify", { :controller => "restaurants", :action => "update_row" })

  # DELETE
  get("/delete_restaurant/:id_to_remove", { :controller => "restaurants", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
