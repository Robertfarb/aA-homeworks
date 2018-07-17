module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    result_toy = Toy.find_or_create_by(name: name)
    self.toys.concat(result_toy)
    self.save
  end
end