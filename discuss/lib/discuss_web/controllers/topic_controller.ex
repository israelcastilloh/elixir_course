defmodule DiscussWeb.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  def new(conn, params) do
    #struct = %Topic{}
    #params = %{}
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html"
  end
end
