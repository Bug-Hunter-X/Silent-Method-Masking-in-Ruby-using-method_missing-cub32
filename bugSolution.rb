```ruby
class MyClass
  def initialize(value)
    @value = value
  end

  def method_missing(method_name, *args, &block)
    if !respond_to?(method_name)
      puts "Method '#{method_name}' called with args: #{args.inspect}"
    else
      super # Delegate to superclass method_missing if it exists
    end
  end
end

class MySubclass < MyClass
  def defined_method
    puts "Defined method called"
  end
end

sub_object = MySubclass.new(20)
sub_object.defined_method # Now works correctly
sub_object.my_method(1,2,3) # Works
```