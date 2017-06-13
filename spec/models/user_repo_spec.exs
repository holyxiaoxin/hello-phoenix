# defmodule HelloPhoenix.UserRepoSpec do
#   use ESpec.Phoenix, model: User, async: true
#   alias HelloPhoenix.User
#
#   @valid_attrs %{name: "A User", username: "eva"}
#
#   describe "converting unique_constraint on username to error" do
#     before do: insert_user(username: "eric")
#     let :changeset do
#       attrs = Map.put(@valid_attrs, :username, "eric")
#       User.changeset(%User{}, attrs)
#     end
#
#     it do: expect(Repo.insert(changeset)).to be_error_result
#
#     context "when name has been already taken" do
#       let :new_changeset do
#         {:error, changeset} = Repo.insert(changeset)
#         changeset
#       end
#
#       it "has error" do
#         error = {:username, {"has already been taken", []}}
#         expect(new_changeset.errors).to have(error)
#       end
#     end
#   end
# end
