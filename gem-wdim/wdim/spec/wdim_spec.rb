require 'spec_helper'

describe Wdim do

  it 'has a version number' do
    expect(Wdim::VERSION).not_to be nil
  end

  it 'has a dictionary path' do
    expect(Wdim::DICTIONARY_PATH).not_to be nil
  end

  describe Wdim::CLI do
    before do
      @wdim_cli = Wdim::CLI.new
    end

    it '#search(term)' do
      expect(@wdim_cli.search("cd")).to eq "change directory"
    end

    context 'when decoratable' do
      it '#print_meaning(term)' do
        @wdim_cli.decoratable = true
        expected_string = ("-" * 40) + "\n\tchange directory\t\n" + ("-" * 40) 
        expect(@wdim_cli.print_meaning("cd")).to eq expected_string
      end
    end

    context 'when not decoratable' do
      it '#print_meaning(term)' do
        @wdim_cli.decoratable = false
        expected_string = "change directory"
        expect(@wdim_cli.print_meaning("cd")).to eq expected_string
      end
    end

    it '#start(argv)' do
      argv = %w(cd hoge fuga)
      expect(@wdim_cli.start(argv)).to eq "change directory"
    end

    it '#decorate(meaning)' do
      expected_string = ("-" * 40) + "\n\tchange directory\t\n" + ("-" * 40)
      expect(@wdim_cli.decorate("change directory")).to eq expected_string
    end

  end
end
