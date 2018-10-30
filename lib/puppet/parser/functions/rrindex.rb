#
# rrindex.rb
#

module Puppet::Parser::Functions
  def self._hash_val(string)
    seed = 2_184_401_929
    hash_val = 0
    string.unpack('C*').map do |c|
      hash_val = (hash_val * seed) + c
      hash_val &= 0xffffffff
    end
    hash_val
  end
  newfunction(:rrindex, type: :rvalue, doc: <<-EOS
Returns round robin index using a string as input.

Synopsis: rrindex(<string>,<index_max>)
Example:  myindex = rrindex($::hostname,5)
    EOS
             ) do |arguments|

    if arguments.length != 2
      raise(Puppet::Error, 'rrindex(): must provide exactly two arguments: <string>,<maxindex>')
    end

    string = arguments[0]
    index_max = arguments[1].to_i

    unless string.is_a?(String)
      raise(Puppet::Error, "rrindex(): `#{string}` is not a String")
    end
    unless index_max.is_a?(Integer)
      raise(Puppet::Error, "rrindex(): index_max `#{index_max}`) should be a FixNum ")
    end
    unless index_max > 0
      raise(Puppet::Error, "rrindex(): index_max `#{index_max}`) should be > 0 ")
    end

    Puppet::Parser::Functions._hash_val(string) % index_max
  end
end

# vim: set ts=2 sw=2 et :
