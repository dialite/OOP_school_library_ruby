require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    return @nameable.correct_name.strip unless @nameable.correct_name.strip > 10

    @nameable.correct_name.strip.slice(0..9)
  end
end
