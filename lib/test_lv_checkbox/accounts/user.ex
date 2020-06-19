defmodule TestLvCheckbox.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :description, :string
    field :email, :string
    field :number, :integer
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :username, :number, :description])
    |> validate_required([:email, :username, :number, :description])
  end
end
