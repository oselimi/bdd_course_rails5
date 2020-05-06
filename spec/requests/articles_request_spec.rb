require 'rails_helper'

RSpec.describe "Articles", type: :request do

  before do
      @article = Article.create(title: "Title one", body: "body od article one")
   end
  describe "GET /articles/:id" do
      context 'with existing article' do
        before {get "/articles/#{@article.id}"}

        it "handels existing article" do
          expect(response.status).to eq 200
        end
      end
    end
    context "with non-existing article" do
      before {get "/articles/xxx"}

      it "handles non-exsiting article" do
        expect(response.status).to eq 302
        flash_message = "The article you are looking for could not be found"
        expect(flash[:danger]).to eq flash_message
      end
    end
  end
