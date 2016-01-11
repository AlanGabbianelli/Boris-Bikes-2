class Bike
  def working?
    @working
  end

  def report_broken
    @working = false
  end

  def fixme
    @working = true
  end
end
