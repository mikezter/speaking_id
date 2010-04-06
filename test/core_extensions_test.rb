# encoding: UTF-8

require 'test_helper'

class SpeakingIdTest < ActiveSupport::TestCase
  test 'should normalize a simple string' do
    assert_equal 'the-sandals', 'The Sandals'.normalize
  end

  test 'should normalize special characters' do
    assert_equal 'oeaeue-oeaeue-ss', '  ÖÄÜ öäü ß %@: .&? ---'.normalize
  end

  test 'should normalize a string using underscores as separator' do
    assert_equal 'a_b_c', 'A B C ...'.normalize('_')
  end

  test 'should normalize and return an empty string' do
    assert ' &?=... '.normalize.empty?
  end
end

