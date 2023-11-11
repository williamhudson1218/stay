defmodule Stay.Context.Listings do
  import Ecto.Query, warn: false

  alias Stay.Repo
  alias Stay.Listings.Listing

  def list_listings do
    Repo.all(Listing)
  end

  def get_listing(id) do
    Repo.get(Listing, id)
  end

  def create_listing(attrs) do
    changeset =
      %Listing{}
      |> Listing.changeset(attrs)

    case Repo.insert(changeset) do
      {:ok, listing} ->
        {:ok, listing}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def update_listing(listing, attrs) do
    listing
    |> Listing.changeset(attrs)
    |> Repo.update()
  end

  def delete_listing(listing) do
    Repo.delete(listing)
  end
end
