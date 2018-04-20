class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    queue << el
  end

  def dequeue
    queue.shift
  end

  def show
    queue.dup
  end
end
