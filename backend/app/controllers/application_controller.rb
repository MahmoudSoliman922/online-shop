# frozen_string_literal: true

class ApplicationController < ActionController::API
  def render_json(result)
    render(json: { success: result.instance_variable_get(:@errors).blank?, response: result.instance_variable_get(:@response), errors: result.instance_variable_get(:@errors) })
  end
end
