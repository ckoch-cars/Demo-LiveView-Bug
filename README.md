# TestLvCheckbox


### Setup

  * mix phx.new test_lv_checkbox --live
  * mix phx.gen.live Accounts User users email:string username:string number:integer description:string
  * mix do ecto.create, ecto.migrate

    Add the live routes to your browser scope (per phx gen.live instructions) in lib/test_lv_checkbox_web/router.ex:

    live "/users", UserLive.Index, :index
    live "/users/new", UserLive.Index, :new
    live "/users/:id/edit", UserLive.Index, :edit

    live "/users/:id", UserLive.Show, :show
    live "/users/:id/show/edit", UserLive.Show, :edit

  * Added checkboxes to the user form.

### Reproduce the issue

  * run the server `mix phx.server`

  * Navigate to:
    http://localhost:4000/users/1/edit
    or
    http://localhost:4000/users/new

    Note the checkboxes require double input (when changing, or clicking the box the second time.)
    The checkbox validation fires twice.
    Inspecting the forms params, it appears the checkbox (checked) value is set the first time the checkbox is clicked, but the checked state of the html object does not update. Occasionally, there's a briefly noticeable stutter on the page, but the checkbox remains unchecked. Clicking the checkbox again sets the visible state to checked and the checkbox (checked) value remains "true".

    Every time the checkbox is in the unchecked state, it appears to reqiure an extra click in order to get it visibly checked.


