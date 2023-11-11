defmodule Stay.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :location, :string
    field :email, :string
    field :password_hash, :string
    field :first_name, :string
    field :last_name, :string
    field :profile_picture, :string
    field :phone_number, :string
    field :date_of_birth, :date
    field :bio, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :email,
      :password_hash,
      :first_name,
      :last_name,
      :profile_picture,
      :phone_number,
      :date_of_birth,
      :location,
      :bio,
      :inserted_at,
      :updated_at
    ])
    |> validate_required([
      :email,
      :password_hash,
      :first_name,
      :last_name,
      :profile_picture,
      :phone_number,
      :date_of_birth,
      :location,
      :bio,
      :inserted_at,
      :updated_at
    ])
    |> unique_constraint(:email)
  end
end
