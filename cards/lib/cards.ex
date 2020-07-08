defmodule Cards do

  def hello do
    "hi there!"

  end

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


  def contains?(deck, card) do
    Enum.member?(deck, card)
  end


  def deal(deck, hand_size) do
    Enum.split(deck, hand_size) #Returns a dictionary
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)

    case status do #Works like an if statement.
      :ok -> :erlang.binary_to_term(binary)
      :error -> "That file does not exist"
    end
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
