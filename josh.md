# encompass the thing making this difficult (random)
class RandomSequenceGenerator
  def initialize(colours)
    @colours = colours
  end
  def call
    4.times.map { @colours.sample }
  end
end

# from the outside, this looks the same, but we have control over it
class PredeterminedSequenceGenerator
  def initialize(sequence)
    @sequence = sequence
  end
  def call
    @sequence
  end
end


# can't test with random because its value will vary
random_generator = RandomSequenceGenerator.new ['R', 'G', 'B', 'Y']
random_generator.call # => ["B", "G", "Y", "B"]
random_generator.call # => ["R", "G", "Y", "G"]

# can test with this one, because we know what its value is
predetermined_generator = PredeterminedSequenceGenerator.new(['R', 'R', 'G', 'G'])
predetermined_generator.call # => ["R", "R", "G", "G"]
predetermined_generator.call # => ["R", "R", "G", "G"]


class Mastermind
  def initialize(sequence_generator)
    @sequence = sequence_generator.call
  end
  def match?(guess)
    @sequence == guess
  end
end


# do this when wiring it up for tests, we can test the match method easily
generator = PredeterminedSequenceGenerator.new(['R', 'Y', 'Y', 'G'])
mm        = Mastermind.new(generator)
mm.match?(['R', 'Y', 'Y', 'G']) # => true
mm.match?(['R', 'Y', 'Y', 'R']) # => false

# do this when wiring it up to run for real (eg from runner)
generator = RandomSequenceGenerator.new(['R', 'G', 'B', 'Y'])
mm        = Mastermind.new(random_generator)
guess     = ['R', 'Y', 'Y', 'G'] # prompted from user
mm.match?(guess) # => false
