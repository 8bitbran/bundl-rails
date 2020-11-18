class SearchesController < ApplicationController
    before_action :require_login
    
    def show
        @search = Search.find(params[:id])
    end 

    def new 
        @search = Search.new
    end

    def create
        @search = Search.create(search_params)
        redirect_to @search
    end 

    private

    def search_params
        params.require(:search).permit(:name)
    end 

end
