class SearchJob < ApplicationJob
  queue_as :urgent

  def perform(search_params)
    Search.new(search_params).execute
  end
end
