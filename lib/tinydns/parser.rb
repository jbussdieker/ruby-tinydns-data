require "tinydns/record"

module TinyDNS
  class Parser
    def initialize(io)
      @io = io
    end

    def parse
      @io.split("\n").collect do |line|
        unless line.strip.start_with? "#"
          type = line[0]
          name, value, ttl, other = line[1..-1].split(":")
          record = {:type => type, :name => name, :value => value, :ttl => ttl}
          record.merge!(:other => other) if other
          Record.new(record)
        end
      end.reject {|item| item == nil}
    end
  end
end
