class Problem < ActiveRecord::Base
  attr_accessible :code, :description, :input_format, :name, :output_format
end
