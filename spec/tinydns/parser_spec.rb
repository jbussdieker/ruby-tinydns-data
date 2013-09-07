require 'tinydns/parser'

describe TinyDNS::Parser do
  it "basic example" do
    @parser = TinyDNS::Parser.new("=example.com:1.2.3.4:3600")
    @record = TinyDNS::Record.new(
      :type => '=',
      :name => 'example.com',
      :value => '1.2.3.4',
      :ttl => "3600"
    )
    @parser.parse.should eq([@record])
  end

  it "edge case" do
    @parser = TinyDNS::Parser.new(":example.com:1.2.3.4:3600")
    @record = TinyDNS::Record.new(
      :type => ':',
      :name => 'example.com',
      :value => '1.2.3.4',
      :ttl => "3600"
    )
    @parser.parse.should eq([@record])
  end

  it "edge case 2" do
    @parser = TinyDNS::Parser.new("@example.com:1.2.3.4:mail.example.com:3600")
    @record = TinyDNS::Record.new(
      :type => '@',
      :name => 'example.com',
      :value => '1.2.3.4',
      :ttl => "mail.example.com",
      :other => "3600"
    )
    @parser.parse.should eq([@record])
  end
end
