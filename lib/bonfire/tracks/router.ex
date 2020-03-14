defmodule Bonfire.Tracks.Router do
  use Commanded.Commands.Router

  alias Bonfire.Tracks.{
    Commands.StartReading,
    Commands.FinishReading,
    Commands.UntrackReading,
    Aggregates.TrackReading
  }

  identify(TrackReading, by: :track_id, prefix: "reading-state-")
  dispatch([StartReading, FinishReading, UntrackReading], to: TrackReading)
end
