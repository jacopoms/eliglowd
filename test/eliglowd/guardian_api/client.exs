defmodule Eliglowd.GuardianApi.ClientTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock

  alias Eliglowd.GuardianApi.Client

  setup do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes")
    # Client.start
    :ok
  end

  test "make a get request"  do
    {value, response} = Client.make_get_request("")
    IO.inspect(value)
    IO.inspect(response)
    assert value == :error
  end
end
