#
# rrindex.rb
#


####################
# Returns round robin index using a string as input.
# Synopsis: rrindex(<string>,<index_max>)
# Example:  myindex = rrindex($::hostname,5)
####################

Puppet::Functions.create_function(:rrindex) do

  dispatch :rrindex do
    param       'String',  :hostname
    param       'Numeric', :index_max
    return_type 'Numeric'
  end

  ####################
  # Calculate a unique index between 0 and index_max based on the hostname
  ####################
  def rrindex(hostname,index_max)

    # Validate index param is integer > 0 before using
    index_max = index_max.to_i
    unless (index_max > 0)
      raise(Puppet::Error, "rrindex(): index_max (`"+index_max+"`) should be > 0 ")
      return nil
    end

    hash_val(hostname) % index_max 
  end

  ####################
  # Create unique integer based on input string
  ####################
  def hash_val(string)
    seed = 2184401929
    hash_val = 0
    string.unpack("C*").map{
      |c| hash_val = (hash_val * seed) + c
      hash_val &= 0xffffffff
    }
    hash_val
  end

end

# vim: set ts=2 sw=2 et :
