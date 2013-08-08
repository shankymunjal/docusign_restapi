class  DocusignConfigGenerator < Rails::Generators::Base
	source_root File.expand_path("../templates", __FILE__)
  desc "This generator installs config files to communicate with docusign rest api"

	def add_config
		copy_file "docusign_restapi.rb", "config/initializers/docusign_restapi.rb"
	end
end