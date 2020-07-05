Dir.glob(File.join('./domain', '**', '*.rb'), &method(:require)) # include all files
Dir.glob(File.join('./errors', '**', '*.rb'), &method(:require)) # include all files
Dir.glob(File.join('./ports', '**', '*.rb'), &method(:require)) # include all files

cli = CLI.new(ARGF)
cli.run
