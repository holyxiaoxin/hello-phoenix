defmodule ESpec.Phoenix.Extend do
  def model do
    quote do
      alias HelloPhoenix.Repo
    end
  end

  def controller do
    quote do
      alias HelloPhoenix
      import HelloPhoenix.Router.Helpers

      @endpoint HelloPhoenix.Endpoint
    end
  end

  def view do
    quote do
      import HelloPhoenix.Router.Helpers
    end
  end

  def channel do
    quote do
      alias HelloPhoenix.Repo

      @endpoint HelloPhoenix.Endpoint
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
