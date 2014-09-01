module ApplicationHelper
  
  def numeric?(string)
    Float(string) != nil rescue false
  end
end
