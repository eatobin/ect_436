class FinalController < ApplicationController
  def nevermelt
  end

  def proddetail
  end

  def buydone
    if params[:commit] == 'Back To Treats'
      redirect_to(nevermelt_path)
    end

    if (params[:stock].to_i - params[:quant_dd].to_i) < 0
      redirect_to(badquant_path(pid: params[:pid]))
    end
  end

  def badquant
  end
end
