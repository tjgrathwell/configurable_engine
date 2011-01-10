require 'rails/generators'
module Configurable
class InstallGenerator < Rails::Generators::Base
  include Rails::Generators::Migration


   def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
   end
 
   def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end
 
    def create_migration_file
      copy_file 'configurable.yml', 'config/configurable.yml'
      migration_template 'migration.rb', 'db/migrate/create_configurables.rb'
    end
  end
end