class QuestsController < ApplicationController
  before_action :set_quest, only: [ :update, :destroy ]

  def index
    @quests = Quest.all
    @quest = Quest.new
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    if @quest.save
      respond_to do |format|
        # format.turbo_stream
        format.html { redirect_to quests_path }
      end
    else
      render :new
    end
  end

  def update
    @quest.update(status: !@quest.status)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to quests_path }
    end
  end

  def destroy
    @quest.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to quests_path }
    end
  end

  private

  def set_quest
    @quest = Quest.find(params[:id])
  end

  def quest_params
    params.require(:quest).permit(:title, :status)
  end
end
