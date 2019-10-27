class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :edit, :update, :publish, :destroy]

  # GET /newsletters
  # GET /newsletters.json
  def index
    @newsletters = Newsletter.all.order(release_date: :desc)
  end

  # GET /newsletters/1
  # GET /newsletters/1.json
  def show
    @newsletter = Newsletter.find(params[:id])
    @stories = @newsletter.stories
  end

  # GET /newsletters/new
  def new
    @newsletter = Newsletter.new
  end

  # GET /newsletters/1/edit
  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  # POST /newsletters
  # POST /newsletters.json
  def create
    @newsletter = Newsletter.new(newsletter_params)

    respond_to do |format|
      if @newsletter.save
        format.html { redirect_to @newsletter, notice: 'Newsletter was successfully created.' }
        format.json { render :show, status: :created, location: @newsletter }
      else
        format.html { render :new }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newsletters/1
  # PATCH/PUT /newsletters/1.json
  def update
    respond_to do |format|
      if @newsletter.update(newsletter_params)
        format.html { redirect_to @newsletter, notice: 'Newsletter was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def publish
    stories = @newsletter.stories
    lyra_newsletter = MorningBrewLyra::Newsletters.publish(@newsletter, stories)

    @newsletter.published = true
    @newsletter.lyra_id = lyra_newsletter['id']

    if @newsletter.save
      redirect_to @newsletter, notice: 'Newsletter was successfully published to Lyra.'
    else
      redirect_to(:back, notice: 'Unable to save Newsletter')
    end
  end

  # DELETE /newsletters/1
  # DELETE /newsletters/1.json
  def destroy
    MorningBrewLyra::Newsletters.destroy(@newsletter.lyra_id) if @newsletter.published
    @newsletter.destroy
    respond_to do |format|
      format.html { redirect_to newsletters_url, notice: 'Newsletter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:title, :release_date)
    end
end
