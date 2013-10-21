module FiveHelper
  def scoops
    NeverMelt.order(:scoops).distinct.pluck(:scoops)
  end

  def flavors
    NeverMelt.order(:flavor).distinct.pluck(:flavor)
  end

  def all
    NeverMelt.order(:id).distinct.pluck(:pname, :price)
  end
end
