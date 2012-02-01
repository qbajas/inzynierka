# windows hack
#module Wordnik
#  class Configuration
#
#    # Defaults go in here..
#    def initialize
#      @response_format = :json
#      @scheme = 'http'
#      @host = 'api.wordnik.com'
#      @base_path = '/v4'
#      @user_agent = "ruby-#{Wordnik::VERSION}"
#      # Build the default set of resource names from the filenames of the API documentation
#      begin
#        api_docs_path = File.join(File.dirname(__FILE__), "../../api_docs")
#        @resource_names = ['word', 'words']
#        true
#      rescue
#        raise "Problem loading the resource files in ./api_docs/"
#      end
#    end
#
#  end
#end

# configuration
Wordnik.configure do |config|
  config.api_key = 'e9398cfab3a1057854300016bad0a734be59864625e3117e1' # required
  config.username = 'qbajas' # optional, but needed for user-related functions
  config.password = 'Nwctim10' # optional, but needed for user-related functions
  config.response_format = "json" # defaults to json, but xml is also supported
end

#
#Wordnik.configuration.resource_names = ['word', 'words']     # specify all resource names
#Wordnik.instantiate_resources
#Wordnik.create_resource_shortcuts
