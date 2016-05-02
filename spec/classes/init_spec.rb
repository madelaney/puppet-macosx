require 'spec_helper'
describe 'macosx' do

  context 'with defaults for all parameters' do
    it { should contain_class('macosx') }
  end
end
