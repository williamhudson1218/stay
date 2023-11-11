defmodule StayWeb.Graphql.ListingsTest do
  use StayWeb.ConnCase, async: true
  alias Stay.Context.Listings

  defp insert_test_listing(attrs) do
    listing_attrs =
      %{
        description: "A test listing",
        location: "City, Country",
        price: 100.00,
        number_of_bedrooms: 2,
        number_of_bathrooms: 1,
        property_type: "Apartment",
        max_guests: 4,
        amenities: "WiFi, Parking, Kitchen"
      }
      |> Map.merge(attrs)

    {:ok, listing} = Listings.create_listing(listing_attrs)
    listing
  end

  test "listing query successfully retrieves a single listing", %{conn: conn} do
    test_listing = insert_test_listing(%{title: "Test Listing"})

    query = """
      query GetListing($id: ID!) {
        listing(id: $id) {
          id
          title
        }
      }
    """

    variables = %{
      "id" => Integer.to_string(test_listing.id)
    }

    response =
      post(conn, "/graphql", %{query: query, variables: variables})
      |> json_response(200)
      |> Map.get("data")
      |> Map.get("listing")

    assert response["id"] == test_listing.id
    assert response["title"] == "Test Listing"
  end

  test "create_listing mutation successfully creates a listing", %{conn: conn} do
    input = %{
      title: "Cozy Apartment",
      description: "A comfortable place to stay",
      location: "City, Country",
      price: 100.00,
      number_of_bedrooms: 2,
      number_of_bathrooms: 1,
      property_type: "Apartment",
      max_guests: 4,
      amenities: "WiFi, Parking, Kitchen",
      inserted_at: "2023-01-01T12:00:00",
      updated_at: "2023-01-01T12:00:00"
    }

    mutation = """
      mutation CreateListing($input: ListingInput!) {
        createListing(input: $input) {
          id
          title
          description
          location
          price
          number_of_bedrooms
          number_of_bathrooms
          property_type
          max_guests
          amenities
          inserted_at
          updated_at
        }
      }
    """

    variables = %{
      "input" => input
    }

    response =
      post(conn, "/graphql", %{query: mutation, variables: variables})
      |> json_response(200)
      |> Map.get("data")
      |> Map.get("createListing")

    assert response["id"] != nil
    assert response["title"] == "Cozy Apartment"
  end

  test "listings query successfully retrieves a list of listings", %{conn: conn} do
    test_listing_1 = insert_test_listing(%{title: "Listing 1"})
    test_listing_2 = insert_test_listing(%{title: "Listing 2"})
    test_listing_3 = insert_test_listing(%{title: "Listing 3"})

    query = """
      query ListListings {
        listings {
          id
          title
          description
          location
          price
          number_of_bedrooms
          number_of_bathrooms
          property_type
          max_guests
          amenities
          inserted_at
          updated_at
        }
      }
    """

    response =
      post(conn, "/graphql", %{query: query})
      |> json_response(200)
      |> Map.get("data")
      |> Map.get("listings")

    assert length(response) == 3

    # Ensure the titles of the inserted listings are in the response
    assert Enum.any?(response, fn listing -> listing["title"] == test_listing_1.title end)
    assert Enum.any?(response, fn listing -> listing["title"] == test_listing_2.title end)
    assert Enum.any?(response, fn listing -> listing["title"] == test_listing_3.title end)
  end
end
