class String
  def numeric?
    str = self.gsub(',', '')
    true if Float(self) rescue false
  end
end
