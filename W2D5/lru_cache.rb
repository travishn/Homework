class LRUCache
    def initialize(cache_size)
      @cache_size = cache_size
      @cache = []
    end

    def count
      @cache.length
    end

    def add(el)
      if @cache.include?(el)
        @cache.delete(el)
      elsif @cache.length == cache_size
        @cache.shift
      end

      @cache << el
      # adds element to cache according to LRU principle
    end

    def show
      puts @cache
    end

    private
    # helper methods go here!

  end
