defmodule Combinatorics do
  @moduledoc """
  Collection of Combinatorics related methods
  """

  @doc """
  Generate a list of combination list

  ## Examples
      iex> combination([1, 2, 3], 1)
      [[1], [2], [3]]

      iex> combination([1, 2, 3], 2)
      [[1, 2], [1, 3], [2, 3]]

      iex> combination([1, 2, 3], 3)
      [[1, 2, 3]]

      iex> combination(["a", :b, "c", 9], 3)
      [["a", :b, "c"], ["a", :b, 9], ["a", "c", 9], [:b, "c", 9]]

      # Invalid cases
      iex> combination([1, 2, 3], 4)
      []

      iex> combination([], 1)
      []
  """
  @spec combination([any()], integer) :: [[any()]]
  def combination([], _), do: []
  def combination(_, 0), do: []

  def combination(list, 1) do
    list |> Enum.map(&[&1])
  end

  def combination(list, n) do
    for com <- combination(list, n - 1), n <- list -- com do
      com ++ [n]
    end
    |> Enum.uniq_by(&Enum.sort/1)
  end
end
