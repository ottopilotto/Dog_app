require 'spec_helper'

  describe "managing markers" do 
    context "adding new location" do
      it "adds new valid location", js: true do
        user_login
        visit "/locations/new"
        expect(page).to have_text "New Location"
        within "form.new_location" do
          fill_in "location_name", with: "Cytadela"
          fill_in "location_address", with: "Poznań, Cytadela"
          fill_in "location_description", with:"Sth big big description about sth very scary"
          click_button "Create location"
        end
        expect(page).to have_text "Location"
        expect(page).to have_text "Cytadel"
        expect(page).to have_text "Sth big big description about sth very scary"
        within (".leaflet-popup-content") do
          page.should have_text "Cytadela"
          page.should have_text "Sth big big description about sth very scary"
        end
      end 
    end
    context "adding new location on map" do
      it "adds new valid location by click", js: true do
        user_login
        visit "/locations"
        find(".leaflet-tile:last-child").click
        within (".leaflet-popup-content") do
          page.should have_text "Add location"
          click_link "Add location"
        end
        expect(page).to have_text "New Location"
      end
    end
  

    
  end

