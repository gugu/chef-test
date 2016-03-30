name             'app'
maintainer       'Andrii Kostenko'
maintainer_email 'andrey@kostenko.name'
license          'All rights reserved'
description      'Installs/Configures app'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
depends "java"
depends "jenkins"
depends "nginx"
depends "php"
