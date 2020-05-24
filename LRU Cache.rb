=begin

Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.

get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.

The cache is initialized with a positive capacity.

Follow up:
Could you do both operations in O(1) time complexity?

Example:

LRUCache cache = new LRUCache( 2 /* capacity */ );

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       // returns 1
cache.put(3, 3);    // evicts key 2
cache.get(2);       // returns -1 (not found)
cache.put(4, 4);    // evicts key 1
cache.get(1);       // returns -1 (not found)
cache.get(3);       // returns 3
cache.get(4);       // returns 4

=end




class LRUCache

    attr_reader :cache_size, :cache_hash
    
    def initialize(capacity)
        @cache_size = capacity
        @cache_hash = {} # Hash.new
    end

    def get(key)
        return -1 unless cache_hash.key?(key)
        val = cache_hash[key]
        cache_hash.delete(key)
        cache_hash[key] = val
        return val
    end

    def put(key, value)
        if cache_hash.key?(key)
            cache_hash.delete(key)
            cache_hash[key] = value
        elsif cache_hash.size < cache_size
            cache_hash[key] = value
        else
            cache_hash.delete(cache_hash.keys[0])
            cache_hash[key] = value 
        end
    end

end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
