defmodule Stay.Repo.Migrations.CreateListings do
  use Ecto.Migration

  def change do
    create table(:listings) do
      add :title, :string
      add :description, :text
      add :location, :string
      add :price, :decimal
      add :number_of_bedrooms, :integer
      add :number_of_bathrooms, :integer
      add :property_type, :string
      add :max_guests, :integer
      add :amenities, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:listings, [:user_id])
  end
end
