class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(request)
    header = "application/vnd.petsFight.v#{@version}"

    @default || request.headers['Accept'].include?(header)
  end
end
