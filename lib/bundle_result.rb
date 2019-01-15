class BundleResult
  attr_reader :total_flowers, :remaining_flowers, :flower_code

  def initialize(total_flowers, flower_code)
    @total_flowers = total_flowers
    @remaining_flowers = total_flowers
    @flower_code = flower_code
  end
end
