module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    # target_toy = Toy.find_or_create_by(name: name)
    # self.toys << target_toy
    # self.save

    self.toys.find_or_create_by(name: name)
  end
end
