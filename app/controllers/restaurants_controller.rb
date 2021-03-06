class RestaurantsController < ApplicationController


      def index
          @restaurants = Restaurant.all
        end

        def show
          @restaurant = Restaurant.find(params[:id])
          # @restaurants = @restaurant.restaurants
        end

        def new
          @restaurant = Restaurant.new()
        end

        def create
          @restaurant = Restaurant.create(restaurant_params)
            if @restaurant.valid?
              redirect_to restaurants_path
            else
              render "new"
            end
        end

        def edit
          @restaurant = Restaurant.find(params[:id])
        end

        def update
          @restaurant = Restaurant.find(params[:id])
          @restaurant.update(restaurant_params)
          @restaurant.save
          redirect_to @restaurant
        end

        def destroy
          @restaurant = Restaurant.find(params[:id])
          @restaurant.destroy
          redirect_to restaurants_path
        end

        private

        def restaurant_params
          params.require(:restaurant).permit(:name, :location, :food_type)
        end



end
