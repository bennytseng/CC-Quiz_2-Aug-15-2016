class Support < ApplicationRecord
  after_initialize :set_defaults

  def self.search(search)
    where (["name ILIKE ? OR email ILIKE ? OR department ILIKE ? OR message ILIKE?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%" ])
  end

  def humanize_completion
    completion == false ? "Not Done" : "Done"
  end

  private

  def set_defaults
    self.completion ||= false
  end

end
