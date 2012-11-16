require "spec_helper"

describe GoodWriter do

  context "configuration" do
    subject { ENV["GOOD_WRITER_ENV"] }
    it { should == "test" }
  end

  context "requirements" do
    describe GoodWriter::Utils do
      it { should_not be_nil }
    end

    describe GoodWriter::Bot do
      it { should_not be_nil }
    end

    describe GoodWriter::Submiter do
      it { should_not be_nil }
    end
  end

end