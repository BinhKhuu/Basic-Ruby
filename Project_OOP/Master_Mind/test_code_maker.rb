require './code_maker.rb'
require 'minitest/autorun'

class TestCodeMaker
	def test_basic
		game = CodeMaker.new()
		wrong_code = ["black","black",'black','black']
		assert_equal(false,wrong_code.compare?)

	end

end