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
      print_meaning(argv[0])
    end

    def print_meaning(term)
      puts @decoratable ? decorate(search(term)) : search(term)
    end

    def search(term)
      @commands[term] || "Not registered in dictionary."
    end

    def decorate(meaning)
      # TODO: more decorations
      # 作業中にパッと目につく感じにしたいけど、そうすると grep `wdim cd` dictionary.yml みたいな使い方ができなくなる
      # .wdimrc あるいはオプションで指定したい
      "----------------------------------------\n\t#{meaning}\t\n----------------------------------------"
    end
    
  end
end
