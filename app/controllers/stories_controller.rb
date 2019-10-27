class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :set_newsletter, only: %i[show new edit create update destroy]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
    @story
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = @newsletter.stories.build(story_params)

    respond_to do |format|
      if @story.validate
        response = MorningBrewLyra::Stories.create(@story)
        @story.lyra_id = response['id']
        @story.save
        format.html { redirect_to [@newsletter, @story], notice: 'Story was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to [@newsletter, @story], notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    MorningBrewLyra::Stories.destroy(@story.lyra_id)
    @story.destroy
    respond_to do |format|
      format.html { redirect_to newsletter_url(@newsletter), notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    def set_newsletter
      @newsletter = Newsletter.find(params[:newsletter_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:title, :tag, :body)
    end
end
