class ThingsController < ApplicationController
    # when you use run inside a controller, it basically runs:
    #   Thing::Create.(params)
  def create
    @form = ThingForm.new(Thing.new)

    if @form.validate(params[:thing])
      @form.save
      return redirect_to @form.model
    end

    render action :new
  end

  def new
    form Thing::Create # instansitae its model without running any processing code
  end
end
