class Dicom
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :metadata, type: Hash, default: {}
end
