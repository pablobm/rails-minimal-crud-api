module ErrorSerializer

  def self.serialize(errors)
    return if errors.nil?

    json = {}
    new_hash = errors.to_hash(true).map do |k, v|
      v.map do |msg|
        {
          detail: msg,
          source: {
            pointer: %{data/attributes/#{k}}
          },
        }
      end
    end.flatten
    json[:errors] = new_hash
    json
  end

end
