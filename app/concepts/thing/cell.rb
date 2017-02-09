class Thing::Cell < Cell::Concept
  property :name

  def show
    render
  end

private
  def name_link
    link_to model.name, thing_path(model)
  end

  def created_at
    "some fake created at date because i forgot to add a created at fields"
  end
end
