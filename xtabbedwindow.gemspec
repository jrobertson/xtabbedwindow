Gem::Specification.new do |s|
  s.name = 'xtabbedwindow'
  s.version = '0.1.2'
  s.summary = 'Finds and selects a tabbed document within a window ' + 
      'automatically (X11 Windows only).'
  s.authors = ['James Robertson']
  s.files = Dir['lib/xtabbedwindow.rb']
  s.add_runtime_dependency('xdo', '~> 0.0', '>=0.0.4')  
  s.add_runtime_dependency('ruby-wmctrl', '~> 0.0', '>=0.0.6')  
  s.signing_key = '../privatekeys/xtabbedwindow.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/xtabbedwindow'
end
