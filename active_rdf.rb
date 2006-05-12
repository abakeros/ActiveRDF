# = active_rdf.rb
#
# Loader of ActiveRDF library
#
# == Project
#
# * ActiveRDF
# <http://m3pe.org/activerdf/>
#
# == Authors
# 
# * Eyal Oren <first dot last at deri dot org>
# * Renaud Delbru <first dot last at deri dot org>
#
# == Copyright
#
# (c) 2005-2006 by Eyal Oren and Renaud Delbru - All Rights Reserved
#

# Start the logger
require 'logger'
require 'tmpdir'
$logger = Logger.new(Dir.tmpdir + '/activerdf.log') if $logger.nil?
$logger.level = Logger::DEBUG

# We add the active_rdf subdirectory to the LOAD_PATH
if File.symlink?(__FILE__)
    $: << File.dirname(File.expand_path(File.readlink(__FILE__))) + '/active_rdf/src'
    $: << File.dirname(File.expand_path(File.readlink(__FILE__))) + '/active_rdf/src/lib'
else
    $: << File.dirname(File.expand_path(__FILE__)) + '/active_rdf/src'
    $: << File.dirname(File.expand_path(__FILE__)) + '/active_rdf/src/lib'
end

# Load Module Class modification for true abstract class
require 'misc/abstract_class'

# Load common uri in NamespaceFactory
require 'namespace_factory'
NamespaceFactory.load_namespaces

