Gem::Specification.new do |s|
  s.name         = "sw_rpg_animal_wrangler"
  s.version      = "1.0.0"
  s.author       = "Jacob Leonhardt"
  s.email        = "jacob.leonhardt649@gmail.com"
  s.homepage     = "https://github.com/jacobleonhardt/text-game"
  s.summary      = "Textbased RPG micro-mission."
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
end
