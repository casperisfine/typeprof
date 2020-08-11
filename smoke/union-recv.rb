class SuperBase
  def self.foo
    self
  end
end

class Base < SuperBase
  def self.foo
    super
  end
end

class A < Base
  foo
end

class B < Base
  foo
end

__END__
# Revealed types
#  t.rb:9 #=> A.class | B.class

# Classes
class SuperBase
  def self.foo : -> (A.class | B.class)
end

class Base < SuperBase
  def self.foo : -> (A.class | B.class)
end
