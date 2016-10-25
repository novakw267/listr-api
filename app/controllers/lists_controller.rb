#
class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]
  MAX_PAGE_SIZE = ENV['LISTS_MAX_PAGE_SIZE'] || 100

  def size
    size = params.fetch(:size, MAX_PAGE_SIZE).to_i
    return size unless size > MAX_PAGE_SIZE
    MAX_PAGE_SIZE
  end

  def page
    params.fetch(:page, 1).to_i
  end

  def lookahead
    lookahead = params[:lookahead] == 'true' ? 1 : params[:lookahead].to_i
    return lookahead if lookahead < size
    size - 1
  end

  # Used by index action
  private :size, :page, :lookahead

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.order(:created_at)
                 .offset(size * (page - 1))
                 .limit(size + lookahead)

    render json: @lists
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    render json: @list
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    if @list.save
      render json: @list, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    @list = List.find(params[:id])

    if @list.update(list_params)
      head :no_content
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy

    head :no_content
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :hidden)
  end
end
