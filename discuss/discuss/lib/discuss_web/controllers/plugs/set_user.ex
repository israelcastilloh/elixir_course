defmodule DiscussWeb.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias DiscussWeb.User
  alias DiscussWeb.Router.Helpers

  def init(_params) do
  end

  def call(conn, _params) do #params comes from the return value of init function
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Discuss.Repo.get(User, user_id) ->
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end
  end
end
