module FinalHelper
  def scoops
    Cone.unscoped.order(:scoops).distinct.pluck(:scoops)
  end

  def flavors
    Cone.unscoped.order(:flavor).distinct.pluck(:flavor)
  end

  def names
    Cone.pluck(:pname)
  end

  def all_cones
    Cone.all
  end

  def cones_by_scoop(scoops)
    Cone.where({:scoops => scoops})
  end

  def cones_by_flavor(flavor)
    Cone.where({:flavor => flavor})
  end

  def cones_by_scoops_then_flavor(scoops, flavor)
    Cone.where({:scoops => scoops, :flavor => flavor})
  end

  def cones_by_flavor_then_scoops(flavor, scoops)
    Cone.where({:flavor => flavor, :scoops => scoops})
  end

  def first?
    ((params[:narrow_dd].nil? or params[:narrow_dd].empty?) and
        (!params[:scoops_dd].present? and !params[:flavors_dd].present?) and
        (!params[:scoops2_dd].present? and !params[:flavors2_dd].present?)) or
        (params[:flavors2_btn] == "Submit" and !params[:flavors2_dd].present?) or
        (params[:scoops2_btn] == "Submit" and !params[:scoops2_dd].present?) or
        params[:reset_btn] == "Reset"
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

  def which_type
    if third? and params[:scoops_dd].present?
      cones_by_scoop(params[:scoops_dd])
    elsif third? and params[:flavors_dd].present?
      cones_by_flavor(params[:flavors_dd])
    elsif fourth? and params[:scoops2_dd].present?
      cones_by_scoops_then_flavor(params[:scoops2_dd], params[:flavors_dd])
    elsif fourth? and params[:flavors2_dd].present?
      cones_by_flavor_then_scoops(params[:flavors2_dd], params[:scoops_dd])
    else
      all_cones
    end
  end

  def update?
    !params[:names_dd].present? and params[:purchase_btn] == 'Purchase'
  end
end
