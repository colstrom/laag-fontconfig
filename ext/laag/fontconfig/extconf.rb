
# -*- ruby -*-

require 'mkmf' # Ruby Standard Library

require 'laag' # MIT License
require_relative '../../../lib/laag/fontconfig'

LAAG::BuildEnvironment
  .new(LAAG.fontconfig)
  .script { default! }

create_makefile 'laag/fontconfig'
