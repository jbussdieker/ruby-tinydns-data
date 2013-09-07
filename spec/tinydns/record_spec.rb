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

  it "types" do
    TinyDNS::Record.new(:type => '=').type.should eql(:a)
    TinyDNS::Record.new(:type => 'C').type.should eql(:cname)
    TinyDNS::Record.new(:type => '@').type.should eql(:mx)
    TinyDNS::Record.new(:type => '.').type.should eql(:soa)
    TinyDNS::Record.new(:type => "'").type.should eql(:text)
  end
end
