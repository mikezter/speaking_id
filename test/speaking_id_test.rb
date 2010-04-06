# encoding: UTF-8

require 'test_helper'

class Article < ActiveRecord::Base
  has_slug :title
end

class User < ActiveRecord::Base
  has_random_slug :column => :random_slug
end

class SpeakingIdTest < ActiveSupport::TestCase
  load_schema
  
  def setup
    @article = Article.find_or_create_by_title('The Sandals')
  end

  test 'should not change the slug' do
    assert_equal 'the-sandals', @article.slug
    @article.text = 'The Sandals make great music.'
    @article.save
    assert_equal 'the-sandals', @article.slug
  end
  
  test 'should change the slug' do
    assert_equal 'the-sandals', @article.slug
    @article.title = 'Nico & Rushad'
    @article.save
    assert_equal 'nico-rushad', @article.slug
  end
  
  test 'should increase the slug' do
    article = Article.create(:title => 'The Sandals')
    assert_equal 'the-sandals2', article.slug
  end
  
  test 'should increase the slug another time' do
    article = Article.create(:title => 'The Sandals')
    assert_equal 'the-sandals3', article.slug
  end
  
  test 'should generate a random slug' do
    @article.title = ''
    @article.save
    assert_equal 6, @article.slug.length
  end

  test 'should create an user with a random slug' do
    user = User.create(:email => 'test@example.com')
    assert_equal 6, user.random_slug.length
  end
end