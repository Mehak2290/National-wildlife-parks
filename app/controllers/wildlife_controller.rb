class WildlifeController < ApplicationController
    def index
      @wildlife = Wildlife.paginate(page: params[:page], per_page: 10)
      end
      def show
        @wildlife = Wildlife.find(params[:id])
        @park = @wildlife.park
      end
end
