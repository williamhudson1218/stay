defmodule StayWeb.Resolvers.Listings do
  alias Stay.Listings.Listing
  alias Stay.Context.Listings
  alias Stay.Repo

  # Queries
  def list_listings(_args, _info) do
    listings = Repo.all(Listing)
    {:ok, listings}
  end

  def get_listing(%{id: listing_id}, _info) do
    case Repo.get(Listing, listing_id) do
      nil ->
        {:error, "Listing not found"}

      listing ->
        {:ok, listing}
    end
  end

  # Mutations
  def create_listing(%{input: listing_params}, _info) do
    Listings.create_listing(listing_params)
  end

  def update_listing(%{id: listing_id, input: listing_params}, _info) do
    listing = Repo.get(Listing, listing_id)

    case listing do
      nil ->
        {:error, "Listing not found"}

      _ ->
        changeset = Listings.update_listing(listing, listing_params)

        case Repo.update(changeset) do
          {:ok, updated_listing} ->
            {:ok, updated_listing}

          {:error, changeset} ->
            {:error, changeset}
        end
    end
  end

  def delete_listing(%{id: listing_id}, _info) do
    listing = Repo.get(Listing, listing_id)

    case listing do
      nil ->
        {:error, "Listing not found"}

      _ ->
        Repo.delete(listing)
        {:ok, listing}
    end
  end
end
