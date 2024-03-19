class VisitorsController < ApplicationController
    def index
      @visitors = Visitor.paginate(page: params[:page], per_page: 10)
      end
      def show
        @visitor = Visitor.find(params[:id])
        @park = @visitor.park
      end
end
