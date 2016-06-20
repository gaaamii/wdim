module Wdim

  DICTIONARY_PATH = File.expand_path("../../../config/dictionary.yml", __FILE__)

  class CLI

    attr_accessor :decoratable

    def initialize
      @commands = YAML.load_file(DICTIONARY_PATH)
      @decoratable = false
    end

    def start(argv)
      # TODO: parse args and use as options
      return repl if argv.empty?
      print_meaning(argv[0])
    end

    def repl
      @decoratable = true
      loop do
        print "> "
        typed_string = gets.chomp
        typed_string =~ /(exit|quit)/ ? break : print_meaning(typed_string)
      end
    end

    def print_meaning(term)
      puts @decoratable ? decorate(search(term)) : search(term)
    end

    def search(term)
      @commands[term] || "Not registered in dictionary."
    end

    def decorate(meaning)
      "----------------------------------------\n\t#{meaning}\t\n----------------------------------------"
    end
    
  end
end
