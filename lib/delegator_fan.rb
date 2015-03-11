require "delegator_fan/version"

module DelegatorFan
  def  delegator_fan(collection, method)
    define_method(method) do
      instance_variable_get("@#{collection}").collect do |c1|
        if block_given?
          yield(c1.send(method.to_sym))
        else
          c1.send(method.to_sym)
        end
      end
    end
  end
end
