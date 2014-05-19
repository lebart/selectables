require_dependency "selectables/application_controller"

module Selectables
  class SelectablesController < ApplicationController
    before_action :set_selectable, only: [:show, :edit, :update, :destroy]

    def index
      @selectables = Selectable.select(:category).group(:category).order("category").paginate(page: params[:page], per_page: 20)

      # We need to display the elements alphabetically sorted depending on the local.
      # First we build an hash
      h = {}
      #Then we merge values in the hash: the category and the category translated are stored
      @merge = @selectables.collect{|s|  h.merge(category: s.category, value: t(s.category))  }
      #Finaly we sort the array of hashes by the value of the translated category ( :value ). sort_alphabetical is used for the accents
      @sorted_options = @merge.sort_alphabetical_by { |v| v[:value] }
    end

    def selectable_by_category
      @selectables = Selectable.where(category: params[:category]).order("value").paginate(page: params[:page], per_page: 20)
      #render index will not redo the action "index" but will just display the index.html.erb, maybe a redirect_to could be a better option
      render 'index'
    end

    def show
    end

    # GET /selectables/new
    def new
      @selectable = Selectable.new
    end

    # GET /selectables/1/edit
    def edit
    end

    def create
      @selectable = Selectable.new(selectable_params)

      respond_to do |format|
        if @selectable.save
          format.html { redirect_to @selectable, notice: 'Option créée' }
          format.json { render action: 'show', status: :created, location: @selectable }
        else
          format.html { render action: 'new' }
          format.json { render json: @selectable.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @selectable.update(selectable_params)
          format.html { redirect_to @selectable, notice: 'Option mise à jour' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @selectable.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @selectable.destroy
      respond_to do |format|
        format.html { redirect_to selectables_url, notice: 'Option supprimée' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_selectable
        @selectable = Selectable.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def selectable_params
        params.require(:selectable).permit(:category, :value)
      end
  end
end
