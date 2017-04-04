#
# rrindex.rb
#

def hash_val (string)
  seed = 2184401929
  hash_val = 0
  string.unpack("C*").map{
    |c| hash_val = (hash_val * seed) + c
    hash_val &= 0xffffffff
  }
  hash_val
end

module Puppet::Parser::Functions
  newfunction(:rrindex, :type => :rvalue, :doc => <<-EOS
Returns round robin index using a string as input.

Synopsis: rrindex(<string>,<index_max>)
Example:  myindex = rrindex($::hostname,5)
    EOS
  ) do |arguments|

    if arguments.length != 2
      raise(Puppet::Error, "rrindex(): must provide exactly two arguments: <string>,<maxindex>")
    end
    
    string = arguments[0]
    index_max = arguments[1].to_i
    
    unless string.kind_of?(String)
      raise(Puppet::Error, "rrindex(): `#{string}` is not a String")
      return nil
    end
    unless (index_max.kind_of?(Fixnum))
      raise(Puppet::Error, "rrindex(): index_max `#{index_max}`) should be a FixNum ")
      return nil
    end
    unless (index_max > 0)
      raise(Puppet::Error, "rrindex(): index_max `#{index_max}`) should be > 0 ")
      return nil
    end

    hash_val(string) % index_max
  end
end

# vim: set ts=2 sw=2 et :
