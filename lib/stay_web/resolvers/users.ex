defmodule StayWeb.Resolvers.Users do
  alias Stay.Users.User
  alias Stay.Context.Users
  alias Stay.Repo

  # Queries
  def list_users(_args, _info) do
    users = Repo.all(User)
    {:ok, users}
  end

  def get_user(%{id: user_id}, _info) do
    case Repo.get(User, user_id) do
      nil ->
        {:error, "User not found"}

      user ->
        {:ok, user}
    end
  end

  # Mutations
  def create_user(%{input: user_params}, _info) do
    Users.create_user(user_params)
  end

  def update_user(%{id: user_id, input: user_params}, _info) do
    user = Repo.get(User, user_id)

    case user do
      nil ->
        {:error, "User not found"}

      _ ->
        changeset = Users.update_user(user, user_params)

        case Repo.update(changeset) do
          {:ok, updated_user} ->
            {:ok, updated_user}

          {:error, changeset} ->
            {:error, changeset}
        end
    end
  end

  def delete_user(%{id: user_id}, _info) do
    user = Repo.get(User, user_id)

    case user do
      nil ->
        {:error, "User not found"}

      _ ->
        Repo.delete(user)
        {:ok, user}
    end
  end
end
