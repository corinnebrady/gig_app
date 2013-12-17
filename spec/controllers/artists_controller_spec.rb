require 'spec_helper'

describe ArtistsController, :type => :controller do

  describe "GET :index" do
    # before do
    #   FactoryGirl.create_list(:artist, 3)
    # end

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
      @artist = FactoryGirl.create(:artist)
    end

    describe "as HTML" do
      before do
        get :show, :id => @artist.id
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "assigns the requested artist to @artist" do
        get :show, :id => @artist.id
        assigns(:artist).should eq(@artist)
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

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new artist" do
        expect{
          post :create, artist: FactoryGirl.attributes_for(:artist)
        }.to change(Artist,:count).by(1)
      end
      it "redirects to the new artist" do
        post :create, artist: FactoryGirl.attributes_for(:artist)
        response.should redirect_to Artist.last
      end
    end
    context "with invalid attributes" do
      it "does not save the new artist" do
        expect{
          post :create, artist: FactoryGirl.attributes_for(:invalid_artist)
        }.to_not change(Artist,:count)
      end
      it "re-renders the new method" do
        post :create, artist: FactoryGirl.attributes_for(:invalid_artist)
        response.should render_template :new
      end
    end
  end


  describe "GET 'edit'" do
    before do
      @artist = FactoryGirl.create(:artist)
    end

    describe "as HTML" do
      before do
        get :edit, :id => @artist.id
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "assigns the requested artist to @artist" do
        get :edit, :id => @artist.id
        assigns(:artist).should eq(@artist)
      end

      it "should render the edit template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "PUT 'update'" do
    before :each do
      @artist = FactoryGirl.create(:artist)
    end
    context "valid attributes" do
      it "located the requested @artist" do
        put :update, id: @artist, artist: FactoryGirl.attributes_for(:artist)
        assigns(:artist).should eq(@artist)
      end
      it "changes @artist's attributes" do
        put :update, id: @artist, artist: FactoryGirl.attributes_for(:artist, name: "Band That Changes Name Every Week")
        @artist.reload
        @artist.name.should eq("Band That Changes Name Every Week")
      end
      it "redirects to the updated artist" do
        put :update, id: @artist, artist: FactoryGirl.attributes_for(:artist)
        response.should redirect_to @artist
      end
    end
    context "invalid attributes" do
      it "locates the requested @artist" do
        put :update, id: @artist, artist: FactoryGirl.attributes_for(:invalid_artist)
        assigns(:artist).should eq(@artist)
      end
      it "does not change @artist's attributes" do
        put :update, id: @artist, artist: FactoryGirl.attributes_for(:artist, name: nil)
        @artist.reload
        @artist.name.should_not eq(nil)
      end
      it "re-renders the edit method" do
        put :update, id: @artist, artist: FactoryGirl.attributes_for(:invalid_artist)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @artist = FactoryGirl.create(:artist)
    end
    it "deletes the artist" do
      expect{
        delete :destroy, id: @artist
      }.to change(Artist,:count).by(-1)
    end
    it "redirects to artists#index" do
      delete :destroy, id: @artist
      response.should redirect_to artists_path
    end
  end


  describe "GET :fetch" do
    before do
    #   FactoryGirl.create_list(:artist, 3)
      artist1 = FactoryGirl.create(:artist, name: "Mac DeMarco")
      artist2 = FactoryGirl.create(:artist, name: "Scotdrakula")
      artist3 = FactoryGirl.create(:artist, name: "Elvis")
      artist4 = FactoryGirl.create(:artist, name: "Ben David")



    # THIS should be the output of the first each loop:  user.artists = { "Melody Gardot" => true, "Elvis" => true }
    # Will users.artists come out as an array? is that what I have to convert to a hash? Then the artist will have two things (and id and a name)
    # in that case the very first thing i need to do is that each loop

    end

    describe "as HTML" do
      before do
        get :fetch
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "should render the fetch template" do
        expect(response).to render_template("fetch")
      end
    end
  end



end












