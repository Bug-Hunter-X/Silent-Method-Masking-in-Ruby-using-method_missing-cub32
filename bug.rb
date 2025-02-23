```ruby
class MyClass
  def initialize(value)
    @value = value
  end

  def method_missing(method_name, *args, &block)
    # Handle method calls dynamically
    puts "Method '#{method_name}' called with args: #{args.inspect}"
  end

end

object = MyClass.new(10)
object.my_method(1, 2, 3) # This works fine
object.another_method # This also works

# However, calling a method that's defined in a superclass will fail silently
class MySubclass < MyClass
  def defined_method
    puts "Defined method called"
  end
end

sub_object = MySubclass.new(20)
sub_object.defined_method # Works
sub_object.my_method(1,2,3) # Works
```