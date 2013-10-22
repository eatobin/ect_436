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

  def first?
    (params[:narrow_dd].nil? or params[:narrow_dd].empty?) and
        (!params[:scoops_dd].present? and !params[:flavors_dd].present?) and
        (!params[:scoops2_dd].present? and !params[:flavors2_dd].present?)
  end

  def second?
    params[:narrow_dd].present? and params[:narrow_btn] == "Submit"
  end

  def third?
    (params[:scoops_dd].present? and params[:scoops_btn] == "Submit") or
        (params[:flavors_dd].present? and params[:flavors_btn] == "Submit")
  end

  def fourth?
    (params[:scoops2_dd].present? and params[:scoops2_btn] == "Submit") or
        (params[:flavors2_dd].present? and params[:flavors2_btn] == "Submit")
  end
end
