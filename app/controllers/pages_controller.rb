class PagesController < ApplicationController
    def show
    end

    def search
        @search_string = params[:search_string]
    end

    private
        # Never trust parameters from the scary internet, only allow the white list through.
        def search_params
            params.permit(:search_string)
        end
end