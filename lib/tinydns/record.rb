module TinyDNS
  class Record < Hash
    def initialize(params = {})
      params.each do |k,v|
        self[k] = v
      end
    end

    def type
      self[:type]
    end

    def name
      self[:name]
    end

    def to_str
      str = "#{type}#{name}:#{self[:value]}:#{self[:ttl]}"
      if self[:other]
        str << ":#{self[:other]}"
      end
      str
    end
  end
end
