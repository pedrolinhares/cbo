#encoding: UTF-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Cbo' do
  let(:cbo) { CBO::Base.new }

  it 'retorna nome da ocupacao pelo codigo' do
    cbo.ocupacao('010315').should == 'Praça da marinha'
    cbo.ocupacao('010210').should == 'Oficial do exército'
  end

  it 'retorna nome da familia pelo codigo da ocupacao' do
    cbo.familia('010210').should == 'Oficiais das forças armadas'
  end

  it 'busca ocupacoes por nome, retornando hash com todas que combinem com a busca' do
    cbo.buscar_ocupacoes('major').should == {'020115' => 'Major da polícia militar',
                                             '030110' => 'Major bombeiro militar'}
  end
end
