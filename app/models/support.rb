class Support < ApplicationRecord
  after_initialize :set_defaults

  private

  def set_defaults
    self.completion ||= false
  end
end
