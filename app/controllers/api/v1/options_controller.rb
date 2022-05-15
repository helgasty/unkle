class Api::V1::OptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_collection, only: [:list]
  load_and_authorize_resource

  def list
    render json: @collection, status: 200
  end

  private

  def set_collection
    @collection = Option.all.select(:id, :code, :description)
  end
end