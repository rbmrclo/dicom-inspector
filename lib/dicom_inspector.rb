require 'dicom'
require 'mini_magick'

class DicomInspector
  include DICOM

  DICOM.image_processor = :mini_magick

  attr_accessor :file, :tempfile

  def initialize(file)
    @file      = file
    @tempfile  = file[:tempfile]
  end

  def reader
    DObject.read(path)
  end

  def details
    reader.to_hash
  end

  private

    def path
      tempfile.path
    end

end
