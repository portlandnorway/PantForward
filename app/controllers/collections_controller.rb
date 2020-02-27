class CollectionsController < ApplicationController
  before_action :find_collection, only: %i[show]

  def index
    Collection::NEIGHBORHOODS.each do |neighborhood|
      if params['q'] == neighborhood
        @collections = Collection.where(neighborhood: neighborhood)
        @collections = @collections.order(reward: :desc)
        break
      elsif params['q'] == 'reward'
        @collections = Collection.order(reward: :desc)
      else
        @collections = Collection.order(created_at: :desc)
      end
    end
  end

  def map
    Collection::NEIGHBORHOODS.each do |neighborhood|
      if params['q'] == neighborhood
        @collections = Collection.where(neighborhood: neighborhood).geocoded
        break
      else
        @collections = Collection.geocoded #returns collections with coordinates
      end
    end

    @markers = @collections.map do |collection|
      {
        lat: collection.latitude,
        lng: collection.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { collection: collection }),
        image_url: helpers.asset_url('bottle')
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
    @collection.reward = reward_calculation(@collection)
    @collection.save!
    redirect_to dashboard_path(current_user)
  end

  private

  def reward_calculation(collection)
    (collection.big_bottles * 3) + (collection.small_bottles * 2) + collection.tip
  end

  def find_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:address, :tip, :big_bottles, :small_bottles, :details, :neighborhood)
  end
end
