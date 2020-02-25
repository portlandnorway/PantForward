class CollectionsController < ApplicationController
  before_action :find_collection, only: %i[show]

  def index
    # if params['q'] == 'reward'
    #   @collections = Collection.order(reward: :desc)
    # elsif params['q'] == 'oldest'
    #   @collections = Collection.order(created_at: :asc)
    # elsif params['q'] == 'newest'
    #   @collections = Collection.order(created_at: :desc)
    # else
    @collections = Collection.order(created_at: :desc)
    # end
  end

  def map
    @collections = Collection.geocoded #returns collections with coordinates

    @markers = @collections.map do |collection|
      {
        lat: collection.latitude,
        lng: collection.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { collection: collection })
      }
    end
  end

  def show
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    @collection.save
    redirect_to dashboard_path(current_user)
  end

  private

  def find_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:address, :tip, :bottles, :details)
  end
end
