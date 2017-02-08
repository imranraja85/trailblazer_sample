class ThingsController < ApplicationController
  def create
    run Thing::Create do |op|
      return redirect_to op.model
    end

    render action: :new
  end

  def new
    form Thing::Create # instansitae its model without running any processing code
  end
end
