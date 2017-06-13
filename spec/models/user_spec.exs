defmodule HelloPhoenix.UserSpec do
  use ESpec.Phoenix, model: User, async: true
  alias HelloPhoenix.User

  @valid_attrs %{name: "A User", email: "abc@example.com", bio: "some bio..", number_of_pets: 10}
  @invalid_attrs %{}

  context "validation" do
    it "checks changeset with valid attributes" do
      changeset = User.changeset(%User{}, @valid_attrs)
      assert changeset.valid?
    end

    it "checks changeset with long username" do
      attrs = Map.put(@valid_attrs, :name, String.duplicate("a", 30))
      assert {:name, "should be at most 20 character(s)"} in errors_on(%User{}, attrs)
    end
  end

  defp errors_on(struct, data) do
    struct.__struct__.changeset(struct, data)
    |> Ecto.Changeset.traverse_errors(&HelloPhoenix.ErrorHelpers.translate_error/1)
    |> Enum.flat_map(fn {key, errors} -> for msg <- errors, do: {key, msg} end)
  end
end
