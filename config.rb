require 'slim'

# pour obtenir des url sans .html à la fin
activate :directory_indexes

activate :livereload


# require 'font-awesome-sass'
# require 'bootstrap'

# set :css_dir, 'stylesheets'
# set :images_dir, 'images'
# set :partials_dir, 'partials'
# set :build_dir, 'public_html'
# set :relative_links, 'true'
set :images_dir, 'images'
set :js_dir, 'javascripts'
set :fonts_dir, 'fonts'

configure :build do
  # set :relative_links, true
  # set :relative_assets, true
  set :http_prefix, ""

  activate :favicon_maker do |f|
    f.template_dir  = File.join(root, 'source')
    f.output_dir    = File.join(root, 'build')
    f.icons = {
      "_favicon_template.png" => [
        { icon: "apple-touch-icon-152x152-precomposed.png" },
        { icon: "apple-touch-icon-144x144-precomposed.png" },
        { icon: "apple-touch-icon-120x120-precomposed.png" },
        { icon: "apple-touch-icon-114x114-precomposed.png" },
        { icon: "apple-touch-icon-76x76-precomposed.png" },
        { icon: "apple-touch-icon-72x72-precomposed.png" },
        { icon: "apple-touch-icon-60x60-precomposed.png" },
        { icon: "apple-touch-icon-57x57-precomposed.png" },
        { icon: "apple-touch-icon-precomposed.png", size: "57x57" },
        { icon: "apple-touch-icon.png", size: "57x57" },
        { icon: "favicon-196x196.png" },
        { icon: "favicon-160x160.png" },
        { icon: "favicon-96x96.png" },
        { icon: "favicon-32x32.png" },
        { icon: "favicon-16x16.png" },
        { icon: "favicon.png", size: "16x16" },
        { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
        { icon: "mstile-144x144", format: "png" }
      ]
    }
  end

  activate :minify_css
  activate :minify_javascript

end

activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = 'my.bucket.com' # The name of the S3 bucket you are targeting. This is globally unique.
  s3_sync.region                     = 'us-west-1'     # The AWS region for your bucket.
  s3_sync.aws_access_key_id          = 'AWS KEY ID'
  s3_sync.aws_secret_access_key      = 'AWS SECRET KEY'
  s3_sync.delete                     = false # We delete stray files by default.
  s3_sync.after_build                = false # We do not chain after the build step by default.
  s3_sync.prefer_gzip                = true
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
  s3_sync.prefix                     = ''
  s3_sync.version_bucket             = false
  s3_sync.index_document             = 'index.html'
  s3_sync.error_document = '404.html'
end

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
page "/404.html", directory_index: false # :layout => 'page_under_construction',

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

# activer google analytics
activate :google_analytics do |ga|
  ga.tracking_id = 'UA-97725621-1' # Replace with your property ID.
end

# activer google tag manager
activate :google_tag_manager do |gtm|
  gtm.container_id = 'GTM-P3ZBPZG' # required
  gtm.development = false # Render tag in development environment
end
