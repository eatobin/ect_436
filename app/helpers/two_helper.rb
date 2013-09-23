module TwoHelper

  @forward_string = params[:query]

  def forward_string do |@forward_string|
    @forward_string
  end

  def forward_array do |@forward_string|
    @forward_array = @forward_string.split(' ')
  end

  def reversed_array do |@forward_string|
    @reversed_array = @forward_string.split(' ').reverse 
  end
end
