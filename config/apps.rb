##
# This file mounts each application within the Padrino project to a specific path.
# You can mount additional applications using any of these below:
#
#   Padrino.mount("blog").to('/blog')
#   Padrino.mount("blog", :app_class => "BlogApp").to('/blog')
#   Padrino.mount("blog", :app_file =>  "/path/to/blog/app.rb").to('/blog')
#
# You can map also apps to a specified host:
#
#   Padrino.mount_core("Blog").host("blog.example.org")
#   Padrino.mount("Admin").host("admin.example.org")
#   Padrino.mount("WebSite").host(/.*\.?example.org/)
#   Padrino.mount("Foo").to("/foo").host("bar.example.org")
#
# Note 1: that mounted apps by default should be placed into 'apps/app_name'.
# Note 2: if you use host match remember that it's important respect order.
#
# By default, this file simply mounts the core app which was generated with this project.
# However, the mounted core can be modified as needed:
#
#   Padrino.mount_core(:app_file => "/path/to/file", :app_class => "Blog")
#

# Mounts the core application for this project
Padrino.mount_core("Pergola")