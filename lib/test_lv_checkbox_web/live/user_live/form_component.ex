defmodule TestLvCheckboxWeb.UserLive.Struct do
  defstruct email: nil, username: nil, number: nil, description: nil
end

defmodule TestLvCheckboxWeb.UserLive.FormComponent do
  use TestLvCheckboxWeb, :live_component

  alias TestLvCheckbox.Accounts
  alias TestLvCheckboxWeb.UserLive.Struct

  @impl true
  def update(%{user: user} = assigns, socket) do
    changeset = Accounts.change_user(user)
    struct = %Struct{}

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)
     |> assign(:struct, struct)}
  end

  @impl true
  def handle_event("validate", %{"user" => user_params}, socket) do
    IO.inspect("were in VALIDATE")

    changeset =
      socket.assigns.user
      |> Accounts.change_user(user_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"user" => user_params}, socket) do
    save_user(socket, socket.assigns.action, user_params)
  end

  defp save_user(socket, :edit, user_params) do
    case Accounts.update_user(socket.assigns.user, user_params) do
      {:ok, _user} ->
        {:noreply,
         socket
         |> put_flash(:info, "User updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_user(socket, :new, user_params) do
    case Accounts.create_user(user_params) do
      {:ok, _user} ->
        {:noreply,
         socket
         |> put_flash(:info, "User created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
