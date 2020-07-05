class CommandNotFound < StandardError
  attr_reader :command
  def initialize(command)
    @command = command
    super("Command not found or not implemented")
  end
end
