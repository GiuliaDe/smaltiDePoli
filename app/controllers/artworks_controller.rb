class ArtworksController < ApplicationController


  before_filter :load_form_constraints,  on: [:new , :edit]




  def index
    @artworks = Artwork.filter(params.slice(:by_name, :by_dimension))
  end

  def show
    @artwork = Artwork.find(params[:id])
    @collaborations_artists = @artwork.collaborations.map do |collaboration|
      {
        collaboration: collaboration,
        artist: collaboration.artist
      }
    end
  end


  def new
    @artwork = Artwork.new
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end


  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      redirect_to @artwork
    else
      render "new"
    end
  end

  def update

    @artwork = Artwork.find(params[:id])

    if @artwork.update(artwork_params)
      redirect_to @artwork
    else
      render 'edit'
    end

  end


  def destroy

    @artwork = Artwork.find(params[:id])
    @artwork.destroy

    redirect_to artworks_path
  end




  private
    def artwork_params
      params.require(:artwork).permit(:name, :dimension, :description, :production, :notes, :typology, :technique, :quantity, :linkIUAV, :infdate, :supdate, :dateexact)
    end

    def load_form_constraints
      @available_typologies = Artwork::TYPOLOGIES
      @available_techniques = Artwork::TECHNIQUES
      @limit_firstyear = Artwork::FIRST_DATE
      @limit_lastyear = Artwork::LAST_DATE
   end


end