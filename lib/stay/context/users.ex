defmodule Stay.Context.Users do
  import Ecto.Query, warn: false

  alias Stay.Repo
  alias Stay.Users.User

  def list_users do
    Repo.all(User)
  end

  def get_user(id) do
    Repo.get(User, id)
  end

  def create_user(attrs) do
    changeset =
      %User{}
      |> User.changeset(attrs)

    case Repo.insert(changeset) do
      {:ok, user} ->
        {:ok, user}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def update_user(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(user) do
    Repo.delete(user)
  end
end
