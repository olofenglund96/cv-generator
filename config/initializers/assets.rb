# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )



#Am: Precompile neccesary for pipeline to work. Don't append .scss to end of file name. 

Rails.application.config.assets.precompile += ['cv_styles_pdf/olof_pdf.css']
Rails.application.config.assets.precompile += ['cv_styles_pdf/arvid_pdf.css']


#Regex to only precompile scss files without underscore under, eg. 'nebula-css.scss' will be compiled but not '_settings.scss'. Ruby on rails asset pipeline looks
#into lib/assets/stylesheets among others, controlled in the application.css file using Sprocket-specific =require directives..
Rails.application.config.assets.precompile << '/(^[^_\/]|\/[^_])[^\/]*$/'