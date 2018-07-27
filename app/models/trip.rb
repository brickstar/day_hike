class Trip < ApplicationRecord
  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_hiking_distance
    trails.sum(:length)
  end

  def average_hiking_distance
    trails.average(:length)
  end

  def shortest_hiking_distance
    trails.minimum(:length)
  end

  def longest_hiking_distance
    trails.maximum(:length)
  end
end
