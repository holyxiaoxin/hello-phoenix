# ESpec.configure fn(config) ->
#   config.before fn(tags) ->
#     {:shared, hello: :world, tags: tags}
#   end
#
#   config.finally fn(_shared) ->
#     :ok
#   end
# end
# Code.require_file("spec/phoenix_helper.exs")

Code.require_file("#{__DIR__}/phoenix_helper.exs")

ESpec.configure fn(config) ->
  config.before fn(_tags) ->
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(HelloPhoenix.Repo)
  end

  config.finally fn(_shared) ->
    Ecto.Adapters.SQL.Sandbox.checkin(HelloPhoenix.Repo, [])
  end
end
