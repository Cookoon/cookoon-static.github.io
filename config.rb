require 'slim'
# require 'font-awesome-sass'

configure :build do
  set :http_prefix, "/cookoon.fr/cookoon-static.github.io/"
end

set :relative_links, true
set :relative_assets, true

# Notre gem installée, il faut maintenant la configurer. Middleman-deploy offre plusieurs possibilités de déploiement via ftp, sftp, rsync ou git. On doit donc lui indiquer quelle méthode on choisit. On va cette fois ouvrir le fichier config.rb et ajouter ce qui suit avant le bloc configure:
activate :deploy do |deploy|
  deploy.build_before   = true
  deploy.deploy_method  = :git
  deploy.branch         = 'master'
end

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
# page '*.html.erb', layout: true
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'
page "index.html", :layout => 'page_under_construction'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
