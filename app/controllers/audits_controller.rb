class AuditsController < ApplicationController
  # GET /audits
  def index
    respond_to do |format|
      format.csv do
        render csv: Audit.all
      end
    end    
  end
end
