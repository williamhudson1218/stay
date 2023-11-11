defmodule Stay.Listings.Listing do
  use Ecto.Schema
  import Ecto.Changeset

  schema "listings" do
    field :description, :string
    field :title, :string
    field :location, :string
    field :price, :decimal
    field :number_of_bedrooms, :integer
    field :number_of_bathrooms, :integer
    field :property_type, :string
    field :max_guests, :integer
    field :amenities, :string
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(listing, attrs) do
    listing
    |> cast(attrs, [
      :title,
      :description,
      :location,
      :price,
      :number_of_bedrooms,
      :number_of_bathrooms,
      :property_type,
      :max_guests,
      :amenities
    ])
    |> validate_required([
      :title,
      :description,
      :location,
      :price,
      :number_of_bedrooms,
      :number_of_bathrooms,
      :property_type,
      :max_guests,
      :amenities
    ])
  end
end
