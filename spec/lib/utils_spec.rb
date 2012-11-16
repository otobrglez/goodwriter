require "spec_helper"

describe GoodWriter::Utils do

  let(:some_object) do
    class SomeClass; end
    SomeClass.send :include, GoodWriter::Utils
    SomeClass.new
  end

  subject { some_object }
  it { should respond_to :config }

  context "config" do
    subject { some_object.config }
    its(:keys) { should include "redis_url" }
    its("first.last") { should =~ /redis/ }
  end

  context "redis" do
    subject { some_object.redis }
    it { subject.set("ichbin", "Oto Brglez").should == "OK" }
    it { subject.get("ichbin").should =~ /brglez/i }
  end

end
