defmodule OpentelemetryDemoTest do
  use ExUnit.Case
  doctest OpentelemetryDemo

  test "greets the world" do
    assert OpentelemetryDemo.hello() == :world
  end
end
