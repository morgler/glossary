class DefinitionsController < ApplicationController

  def index
    @definitions = Definition.all.order('LOWER(term) asc')
  end

  def create
    @definition = Definition.new(definition_params)
    if @definition.save
      redirect_to definitions_path, notice: 'Created new definition'
    else
      flash[:error] = 'An error occured while saving new definition'
      render :index
    end
  end

  protected

  def definition_params
    params.require(:definition).permit(:term, :definiens)
  end
end
