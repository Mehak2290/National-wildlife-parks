class ParksController < ApplicationController
    def index
      if params[:query].present?
        @parks = Park.search_by_name_and_location(params[:query]).paginate(page: params[:page], per_page: 10)
      else
        @parks = Park.paginate(page: params[:page], per_page: 10)
      end
      @parks = @parks.where(category: params[:category]) if params[:category].present?
    end
      
      def show
        @park = Park.find(params[:id])
        @visitors = @park.visitors
        @facilities = @park.facilities
        @wildlife = @park.wildlife
      end
end
