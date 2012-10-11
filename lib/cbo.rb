require File.dirname(__FILE__) + '/cbo/base'

module CBO
  def self.root_path
    File.expand_path '../..', __FILE__
  end

  def self.ocupacao(codigo)
    @@cbo.ocupacao(codigo)
  end

  def self.buscar_ocupacoes(nome_ocupacao)
    @@cbo.buscar_ocupacoes(nome_ocupacao)
  end

  def self.familia(codigo)
    @@cbo.familia(codigo)
  end

  @@cbo = Base.new
end