module ApplicationHelper
  def pp_json json
    JSON.pretty_generate(json)
  end
end
