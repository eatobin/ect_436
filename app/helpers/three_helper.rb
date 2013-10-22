module ThreeHelper
  def return_capital
    if params[:state] == 'Texas'
      'Austin'
    elsif params[:state] == 'Illinois'
      'Springfield'
    elsif params[:state] == 'Arizona'
      'Phoenix'
    else
      "(...you know, I'm not sure of the capital...)"
    end
  end

  def return_attraction
    if params[:state] == 'Texas'
      'a rodeo'
    elsif params[:state] == 'Illinois'
      'the Sears Tower'
    elsif params[:state] == 'Arizona'
      'the Grand Canyon'
    else
      "(...and I don't know what you might visit)"
    end
  end

  def return_activity
    case params[:pet]
      when 'dog'
        "And, get a new flea collar for your #{params[:pet]}."
      when 'cat'
        "And buy some catnip for your #{params[:pet]}."
      else
        "I don't know WHAT you can do in #{params[:state]} with a #{params[:pet]} in tow!"
    end
  end
end
