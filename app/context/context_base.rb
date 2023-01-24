# frozen_string_literal: true

class ContextBase
  include DCI::Context

  def self.perform(*args, **kwargs, &)
    ctx = new(*args, **kwargs)
    ctx.perform(&)
  end
end
