# restart the puppetmaster when changed
module Puppet::Parser::Functions
  newfunction(:oracle_exists, :type => :rvalue) do |args|

    ora = lookupvar('ora_inst_products')
    if ora.nil?
      return false
    else
      software = args[0].strip
      os = lookupvar('operatingsystem')
      if os == "windows"
        software = software.gsub("/","\\")
      end 
      if ora.include? software
        return true
      end
    end
    return false
  end
end

