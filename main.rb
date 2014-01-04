require 'bundler'

Bundler.require


class MyPublisher
  include Wisper::Publisher

  def initialize
    puts "publisher.new"
    puts Thread.current
  end

  def do_something
    puts "publishing"
    puts Thread.current
    publish(:done_something)
  end
end

class MyListener
  def initialize
    puts "mylistener.new"
    puts Thread.current
  end

  def done_something
    puts "getting the event"
    puts Thread.current
  end

end


my_publisher = MyPublisher.new
my_publisher.subscribe(MyListener.new, async: true)

my_publisher.do_something

