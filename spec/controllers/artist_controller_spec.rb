require 'spec_helper'

describe ArtistController do

  describe "GET :index" do
    before do
      FactoryGirl.create_list(:artist, 3)
    end

    describe "as HTML" do
      before do
        get :index
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "should render the index template" do
        expect(response).to render_template("index")
      end
    end
  end

  describe "GET :show" do
    before do
      FactoryGirl.create_list(:artist, 3)
    end

    describe "as HTML" do
      before do
        get :show
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "should render the show template" do
        expect(response).to render_template("show")
      end
    end
  end

  describe "GET 'new'" do
    describe "as HTML" do
      before do
        get :new
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "should render the new template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET 'create'" do
    describe "as HTML" do
      before do
        get :create
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "should render the create template" do
        expect(response).to render_template("create")
      end
    end
  end


  describe "GET 'edit'" do
    before do
      FactoryGirl.create_list(:artist, 3)
    end

    describe "as HTML" do
      before do
        get :edit
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "should render the edit template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "GET 'update'" do
    before do
      FactoryGirl.create_list(:artist, 3)
    end

    describe "as HTML" do
      before do
        get :update
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "should render the update template" do
        expect(response).to render_template("update")
      end
    end
  end

  describe "GET 'destroy'" do
    before do
      FactoryGirl.create_list(:artist, 3)
    end

    describe "as HTML" do
      before do
        get :destroy
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "should render the destroy template" do
        expect(response).to render_template("destroy")
      end
    end
  end








  describe "POST :index" do
    describe "an artist with a name" do
      before do
        post :create, :artist => { :name => "Elvis" }
      end

      it "should redirect to the show action" do
        expect(response.status).to eq(302)
        expect(response).to redirect_to(artist_path(assigns(:artist)))
      end

      it "should increase the number of artists" do
        expect(Fruit.count).to eq(1)
      end
    end

    describe "a artiste without a name" do
      before do
        post :create, {}
      end

      it "should give us a 200 sucess" do
        expect(response.status).to eq(200)
        expect(response).to be_success
      end

      it "should render the new template" do
        expect(response).to render_template("new")
      end

      it "should not increase the number of artists" do
        expect(Fruit.count).to eq(0)
      end


    end


  end


end
