class StaticPagesController < ApplicationController
  def home
  end

  private

    def find_list
      @list = List.find(params[:list_id])
    end
end
