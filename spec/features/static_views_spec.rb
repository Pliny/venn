require 'spec_helper'

describe "Static Views" do

  subject { page.body }

  describe "index" do

    before { visit root_path }

    it { should have_selector("#content") }
  end
end
