class CollaborationsController < ApplicationController

  before_filter :load_relation_object,  on: [:new , :edit]


  def index
    @collaborations = Collaboration.all
  end

  def new
    @collaboration = Collaboration.new
  end

  def create
    @collaboration = Collaboration.new(collaboration_params)

    if @collaboration.save
      redirect_to @collaboration
    else
      render "new"
    end
  end

  def show
    @collaboration = Collaboration.find(params[:id])
  end

  def edit
    @collaboration = Collaboration.find(params[:id])
  end

  def update

    @collaboration = Collaboration.find(params[:id])


    if @collaboration.update(collaboration_params)
      redirect_to @collaboration
    else
      render 'edit'
    end

  end

  def destroy

    @collaboration = Collaboration.find(params[:id])
    @collaboration.destroy

    redirect_to collaborations_path
  end


  private
    def collaboration_params
      params.require(:collaboration).permit(:typology,:artist_id,:artwork_id)
    end

    def load_relation_object
      @artworks = Artwork.all
      @artists = Artist.all
    end

end
