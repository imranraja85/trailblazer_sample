# An operation is an orchestrator dispatching events between the different layers
#
# All layers are separate objects that have no knowledge about the context
# they are being executed in.
#
# An Operation is not a god operation
#   There is a distinction between implementation and orchestration. 
#   You need to define the steps somewhere to process the request and 
#   run the business logic.

class Thing < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include Model
    model Thing, :create

    contract do
      property :name
      property :description

      validates :name, presence: true
      validates :description, length: {in: 4..160}, allow_blank: true
    end

    def process(params)
      thing = Thing.new

      validate(params[:thing]) do |f|
        f.save
      end
    end
  end

  class Update < Create
    action :update

    contract do
      property :name, writeable: false
    end
  end
end
