defmodule StayWeb.Graphql.UsersTest do
  use StayWeb.ConnCase, async: true
  alias Stay.Context.Users

  defp insert_test_user do
    user_attrs = %{
      location: "City, Country",
      email: "test@example.com",
      password_hash: "secure_password",
      first_name: "John",
      last_name: "Doe",
      profile_picture: "url/to/picture.jpg",
      phone_number: "1234567890",
      date_of_birth: "1990-01-01",
      bio: "A test user",
      inserted_at: "2023-01-01T12:00:00",
      updated_at: "2023-01-01T12:00:00"
    }

    {:ok, user} = Users.create_user(user_attrs)
    user
  end

  test "create_user mutation successfully creates a user", %{conn: conn} do
    input = %{
      location: "City, Country",
      email: "test@example.com",
      password_hash: "secure_password",
      first_name: "John",
      last_name: "Doe",
      profile_picture: "url/to/picture.jpg",
      phone_number: "1234567890",
      date_of_birth: "1990-01-01",
      bio: "A test user",
      inserted_at: "2023-01-01T12:00:00",
      updated_at: "2023-01-01T12:00:00"
    }

    mutation = """
      mutation CreateUser($input: UserInput!) {
        createUser(input: $input) {
          id
          email
          email
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
      |> Map.get("createUser")

    assert response["id"] != nil
    assert response["email"] == "test@example.com"
  end

  test "user query successfully retrieves user information", %{conn: conn} do
    user = insert_test_user()

    query = """
      query GetUser($id: ID!) {
        user(id: $id) {
          id
          email
          # Add any other fields you want to test
        }
      }
    """

    variables = %{
      "id" => Integer.to_string(user.id)
    }

    response =
      post(conn, "/graphql", %{query: query, variables: variables})
      |> json_response(200)
      |> Map.get("data")
      |> Map.get("user")

    assert response["id"] == user.id
    assert response["email"] == user.email
  end
end
