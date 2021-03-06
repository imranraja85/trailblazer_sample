class Thing::Cell < Cell::Concept

  include ActionView::Helpers::DateHelper
  include Rails::Timeago::Helper

  property :name
  property :created_at

  def show
    render
  end

  class Grid < Cell::Concept
    def show
      things = Thing.all
      concept("thing/cell", collection: things, last: things.last)
    end
  end

private

  def name_link
    link_to model.name, thing_path(model)
  end

  def created_at
    timeago_tag(super)
  end

  def classes
    classes = ['large-3', 'columns']
    classes << "end" if options[:last] == model
    classes
  end

end
