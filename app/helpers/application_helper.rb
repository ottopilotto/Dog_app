module ApplicationHelper

  def show_map(location, params={})
    if location
      return content_tag :div, :id => 'map', 
        :'data-latitude' => location.latitude, :'data-longitude' => location.longitude,
        :'data-address' => location.address, :'data-name' => location.name, :'data-id' => location.id,
        :'data-description' => location.description do
      end
    else
      return content_tag :div, :id => 'map',
        :'data-latitude' => '52.4079364', :'data-longitude' => '16.9433221',
        :'data-address' => 'Poznań, Czartoria', :'data-name' => 'Runaway', :'data-id' => 1,
        :'data-description' => 'Perfect place for your dog' do
      end 
    end
  end

  
end
