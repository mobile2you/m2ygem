require "json"
require "ostruct"

class CdtModel < OpenStruct

  def as_json(options = nil)
    @table.as_json(options)
  end

end