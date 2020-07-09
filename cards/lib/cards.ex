defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling deck of cards
  """
  @doc """
    Returns a list of strings rep. a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    for suit <- suits, value <- values do #Single list with all combinations
        "#{value} of #{suit}"
    end
  end


  def shuffle(deck) do
    Enum.shuffle(deck)
  end


@doc """
  Determines whether a deck contains a given card

##Example
    iex> deck = Cards.create_deck
    iex> Cards.contains?(deck, "Ace of Spades")
    iex> true

"""
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and remainder of deck.
    The 'hand_size' argument indicates how many cards should be in
    the hand.

  ## Examples
      iex> deck = Cards.create_deck
      iex> {hand,deck} = Cards.deal(deck,1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size) #Returns a dictionary
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do #Works like an if statement.
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle #pipe operator
    |> Cards.deal(hand_size) #pipe operator asigns the other param of deal
  end

end

#Cards.hello can be call in shell as a method.
#Implicit return, no return whatsoever
#Single quotes is supported but better ""
# iex -S mix to compile
#recompile to recompile

#Multiplie methods with same name, and accept dif arguments shuffle/0
#You can pass methods that accept 2 arguments shufle/2
#by convention if method has a question mark - ? -  it means a Bool value.
#Immutability
#List comprehension -> a mapping function

# = is pattern matching
#elrgan. (object) takes the arguments and turns it into object to be saved
# ok and error are "atoms", status codes or messages
