class CollectionsController < ApplicationController
  before_action :find_collection, only: %i[show edit update destroy]

  def index
    Collection::NEIGHBORHOODS.each do |neighborhood|
      if params['q'] == neighborhood
        @collections = Collection.where(neighborhood: neighborhood)
        @collections.select { |c| c.bookings.empty? }
        @collections = @collections.order(reward: :desc)
        break
      elsif params['q'] == 'reward'
        @collections = Collection.order(reward: :desc).select { |c| c.bookings.empty? }
      else
        @collections = Collection.order(created_at: :desc).select { |c| c.bookings.empty? }
      end
    end
  end

  def map
    Collection::NEIGHBORHOODS.each do |neighborhood|
      if params['q'] == neighborhood
        @collections = Collection.where(neighborhood: neighborhood)
        @collections.select { |c| c.bookings.empty? }
        break
      else
        @collections = Collection.all.select { |c| c.bookings.empty? }
      end
    end

    @markers = @collections.map do |collection|
      {
        lat: collection.latitude,
        lng: collection.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { collection: collection }),
        image_url: helpers.asset_url('cropped-logo-black')
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
    redirect_to dashboard_path
  end

  def edit
  end

  def update
    @collection.update(collection_params)
    redirect_to dashboard_path
  end

  def destroy
    @collection.destroy
    redirect_to dashboard_path
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
