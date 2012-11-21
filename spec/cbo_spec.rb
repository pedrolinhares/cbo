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

  context 'busca ocupações' do
    it 'por nome, retornando hash com todas que combinem com a busca' do
      resultado = {
        '020115' => 'Major da polícia militar',
        '030110' => 'Major bombeiro militar'
      }
      cbo.buscar_ocupacoes('major').should == resultado
    end

    it 'com caracteres especiais' do
      resultado = { '252305' => 'Secretária(o) executiva(o)' }
      cbo.buscar_ocupacoes('secretária(o) executiva(o').should == resultado

      resultado = { '111220' => 'Secretário - executivo' }
      cbo.buscar_ocupacoes('secretário -').should == resultado

      resultado = { '225335' => 'Médico patologista clínico / medicina laboratorial' }
      cbo.buscar_ocupacoes('clínico /').should == resultado
    end
  end
end
