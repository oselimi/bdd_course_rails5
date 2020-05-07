require 'rails_helper'

RSpec.feature "Deleteing on Article" do

  before do
    @article = Article.create(title:"Title", body:"Lorem ipdom dolor sit ament")
  end

  scenario "A user deltes on article" do
    visit '/'
    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end
end