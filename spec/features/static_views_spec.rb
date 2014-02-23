require 'spec_helper'

describe "Static Views" do

  subject { page.body }

  describe "index" do

    before { visit root_path }

    it { should have_selector("#content") }
    it { should have_selector(".title1") }
    it { should have_selector(".title2") }
    it { should have_selector("input") }
  end
end
