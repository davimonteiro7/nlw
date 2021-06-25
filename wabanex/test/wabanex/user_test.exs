defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset." do
      params = %{name: "Davi Monteiro", email: "davimonteiro7@mail.com", password: "1234567"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
        valid?: true,
        changes: %{email: "davimonteiro7@mail.com", name: "Davi Monteiro", password: "1234567"},
        errors: []
      } = response
    end

    test "when there are invalid params, returns a invalid changeset." do
      params = %{name: "Da", email: "davimonteiro7@mail.com"}

      response = User.changeset(params)

      expected_response = %{name: ["should be at least 6 character(s)"], password: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
