require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('sample.txt','r')
    @sample_text = Text.new(@file.read)
  end

  def test_swap
    expected_output = <<~OUTPUT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.\nSuspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet\nquem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo\nnulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum\ndolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres\net verius meuris, et pheretre mi.\n
    OUTPUT
    
    assert_equal expected_output, @sample_text.swap('a','e')
  end

  def test_word_count
    assert_equal 72, @sample_text.word_count
  end

  def teardown
    @file.close
  end 
end
