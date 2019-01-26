class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      self.instance_eval do
        define_method(name) do
          self.instance_variable_get("@#{name}")
        end

        define_method("#{name}=") do |val|
          self.instance_variable_set("@#{name}", val)
        end
      end
    end
  end
end
