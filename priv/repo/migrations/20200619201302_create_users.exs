defmodule TestLvCheckbox.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :username, :string
      add :number, :integer
      add :description, :string

      timestamps()
    end

  end
end
