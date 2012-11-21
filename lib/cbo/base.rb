#encoding: UTF-8

module CBO
  class Base
    def initialize
      carregar_ocupacoes
      carregar_familias
    end

    def ocupacao(codigo)
      @ocupacoes[codigo]
    end

    def familia(codigo)
      @familias[codigo[0..3]]
    end

    def buscar_ocupacoes(nome_ocupacao)
      nome_ocupacao = limpar_para_regex(nome_ocupacao)
      regex = /.*#{nome_ocupacao}.*/i
      encontrados = {}
      @ocupacoes.each do |codigo, nome|
        if nome.match regex
          encontrados[codigo] = nome
        end
      end
      encontrados
    end

    private

    def limpar_para_regex(string)
      string.sub('(', '\(').sub(')', '\)').sub('/', '\/').sub('-', '\-')
    end

    def carregar_ocupacoes
      @ocupacoes = {}
      path = CBO.root_path + "/files/CBO2002 - Ocupacao.txt"
      File.open(path, "r:UTF-8") do |file|
        file.each do |line|
          @ocupacoes[line[0..5]] = line[7..-1].chomp
        end
      end
    end

    def carregar_familias
      @familias = {}
      path = CBO.root_path + "/files/CBO2002 - Familia.txt"
      File.open(path, "r:UTF-8") do |file|
        file.each do |line|
          @familias[line[0..3]] = line[5..-1].chomp
        end
      end
    end
  end
end
