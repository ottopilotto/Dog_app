module ApplicationHelper

  def show_map(location, params={})
    content_tag :div, :id => 'map', 
      :'data-latitude' => location.latitude, :'data-longitude' => location.longitude,
      :'data-address' => location.address, :'data-name' => location.name, :'data-id' => location.id do
    end
  end

  
end
