require "spec_helper"

describe GoodWriter::Utils do

  subject do
    class SomeClass; end
    SomeClass.send :include, GoodWriter::Utils
    some_class = SomeClass.new
  end

  it { should respond_to :config }

end
