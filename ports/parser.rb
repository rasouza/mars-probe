class Parser
  class << self

    AMOUNT = Math::PI/2

    def position(position)
      x, y, direction = position.split(' ')

      position = [x, y].map(&:to_i)
      direction = direction.to_sym

      [position, direction]
    end

    def planet(size)
      size.split(' ').map(&:to_i)
    end

    def commands(commands)
      commands.chars.map do |command|
        begin
          send(command)
        rescue NoMethodError
          raise CommandNotFound.new(command)
        end
      end

    end

    def L
      [:rotate, AMOUNT]
    end

    def R
      [:rotate, -AMOUNT]
    end

    def M
      :move!
    end

    def P
      :take_picture
    end
  end
end
