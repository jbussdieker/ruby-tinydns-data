require 'tinydns/record'

describe TinyDNS::Record do
  it "to_str" do
    @record = TinyDNS::Record.new(
      :type => '=',
      :name => 'example.com',
      :value => '1.2.3.4',
      :ttl => "3600"
    )
    @record.to_str.should eql("=example.com:1.2.3.4:3600")
  end
end
