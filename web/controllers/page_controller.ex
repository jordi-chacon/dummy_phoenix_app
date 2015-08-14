defmodule DummyPhoenixApp.PageController do
  use DummyPhoenixApp.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
