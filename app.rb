Dir.glob(File.join('./{domain,errors,ports}', '**', '*.rb'), &method(:require)) # include all files

cli = CLI.new(ARGF)
cli.run
