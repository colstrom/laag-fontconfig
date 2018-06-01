
# -*- ruby -*-

require 'laag/library' # MIT License

module LAAG
  FONTCONFIG_GEM_ROOT = File.expand_path(File.join(__dir__, %w[.. ..]))
  FONTCONFIG_ORIGIN  = 'anongit.freedesktop.org/git/fontconfig'
  FONTCONFIG_VERSION = (
    $LOADED_FEATURES
      .map { |f| f.match %r{/laag-fontconfig-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)} }
      .compact
      .map { |gem| gem['version'] }
      .uniq
      .first
  ) || (
    File
      .basename(FONTCONFIG_GEM_ROOT)
      .match(%r{^laag-fontconfig-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)})['version']
  )

  def self.fontconfig
    @@fontconfig ||= Library.new(
      gem_root: FONTCONFIG_GEM_ROOT,
      origin:   FONTCONFIG_ORIGIN,
      version:  FONTCONFIG_VERSION
    )
  end
end
