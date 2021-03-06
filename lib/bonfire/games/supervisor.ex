defmodule Bonfire.Games.Supervisor do
  @moduledoc false

  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  def init(_init_arg) do
    children = [
      Bonfire.Games.Projector,
      Bonfire.Games.ProcessManager
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
