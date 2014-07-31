module GschoolEnumerable

  def g_each #for loop, used in programming languages that don't have the each methods
    for item in self #self is the instance of the array in this case
      yield(item)
    end
    return self #This is an implicit block
  end


  def g_select
    ary = []
    self.g_each do |item|
      if yield(item)
        ary << item
      end
      # [].tap { |x| each { |e| x << e if yield(e) } }
      # def g_select(&block)
      #   [].tap do |array|
      #     g_each do |item|
      #       if block.call(item)
      #         array << item
      #       end
      #     end
      #   end
      # end
    end
    ary
  end

  def g_reject
    ary = []
    self.g_each do |item|
      ary << item if yield(item) == false
      # ary << item
    end
    ary
  end

  def g_map
    x = []
    each { |e| x << yield(e) }
    x
    # [].tap { |x| each { |e| x << yield(e) } }
  end

  def g_find
    self.g_each do |item|
      return item if yield(item)
    end
    nil
  end


  def g_select!
    self.g_each do |item|
      if yield(item)
      else
        self.delete(item)
      end
    end
  end
end


# When you put self inside an instance method, its defining an array
#Explicit block
# def g_each(&block)
#   for item in self
#     block.call(item)
#   end
# return self
# end

#Need to give yield a block
