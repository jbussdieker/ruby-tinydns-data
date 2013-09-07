module TinyDNS
  class Record < Hash
    def initialize(params = {})
      params.each do |k,v|
        self[k] = v
      end
    end

    def type
      case self[:type]
        when "C"
          :cname
        when "="
          :a
        when "@"
          :mx
        when "."
          :soa
        when "'"
          :text
        else
          self[:type]
      end
    end

    def name
      self[:name]
    end

    def value
      self[:value]
    end

    def ttl
      self[:ttl]
    end

    def to_str
      str = "#{self[:type]}#{name}:#{value}:#{ttl}"
      if self[:other]
        str << ":#{self[:other]}"
      end
      str
    end
  end
end
