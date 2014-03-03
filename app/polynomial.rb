class Polynomial
  
  def initialize(coefs)
    if coefs.nil? || !coefs.kind_of?(Array) || coefs.size < 2
      raise ArgumentError, "Need at least 2 coefficients."
    end

    @coefs = coefs
  end
  
  def to_s
    power = @coefs.size
    parts = @coefs.map do |coef|
      power -= 1
      coef   = coef.to_i
      unless coef == 0
        part   = (power == 0 || coef.abs != 1) ? coef.to_s : (coef > 0 ? '' : '-')
        part  += (power == 0) ? '' : (power == 1) ? 'x' : "x^#{power}"
      end
    end.compact
    
    return parts.empty? ? '0' : (parts.compact * '+').gsub('+-', '-')
  end
  
end
