module ThreeHelper
  def return_capital(p_state)
    if p_state == 'Texas'
      'Austin'
    elsif p_state == 'Illinois'
      'Springfield'
    elsif p_state == 'Arizona'
      'Phoenix'
    else
      "(...you know, I'm not sure of the capital...)"
    end
  end

  def return_attraction(p_state)
    if p_state == 'Texas'
      'a rodeo'
    elsif p_state == 'Illinois'
      'the Sears Tower'
    elsif p_state == 'Arizona'
      'the Grand Canyon'
    else
      "(...and I don't know what you might visit)"
    end
  end

  def return_activity(p_pet)
    case p_pet
      when 'dog'
        "And, get a new flea collar for your #{p_pet}."
      when 'cat'
        "And buy some catnip for your #{p_pet}."
      else
        "I don't know WHAT you can do in #{params[:state]} with a #{p_pet} in tow!"
    end
  end
end
