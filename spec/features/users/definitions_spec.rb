require 'rails_helper'

# Feature: Navigation links
#   As a visitor
#   I want to see navigation links
#   So I can find home, sign in, or sign up
feature 'Definitions', :devise do

  context 'list' do
    let!(:def_a) {create(:definition, term: 'Aterm', definiens: 'definiens A')}
    let!(:def_c) {create(:definition, term: 'Cterm', definiens: 'definiens C')}
    let!(:def_e) {create(:definition, term: 'Eterm', definiens: 'definiens E')}

    scenario 'all definitions' do
      visit definitions_path

      expect(page).to have_content(def_a.term)
      expect(page).to have_content(def_a.definiens)
      expect(page).to have_content(def_c.term)
      expect(page).to have_content(def_c.definiens)
      expect(page).to have_content(def_e.term)
      expect(page).to have_content(def_e.definiens)
    end

    scenario 'in alphabetical order' do
      pending
      def_b = create(:definition, term: 'Bterm', definiens: 'definiens B')
      
      visit definitions_path

      expect(page.body).to match "Aterm.*Bterm.*Cterm.*Eterm"
    end
  end

  scenario 'add a definition' do
    visit definitions_path

    fill_in 'definition_term', with: 'NewTerm'
    fill_in 'definition_definiens', with: 'A new definiens defining the new term'
    click_on 'Save Definition'
  end

end
