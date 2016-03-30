module Exceptions
  class Base < StandardError
    def as_json(options=nil)
      { error: message }
    end
  end
end
