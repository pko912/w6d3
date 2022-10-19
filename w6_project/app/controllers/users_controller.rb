class UsersController < ApplicationController

    def index
        render plain: "Peter is so cool!"
    end

    def create
        render json: params
    end

end