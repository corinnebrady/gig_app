require 'spec_helper'

describe EventsController do


  describe "GET :index" do
    before do
      FactoryGirl.create_list(:event, 3)
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
      # FactoryGirl.create_list(:event, 3)
      @event = FactoryGirl.create(:event)
    end

    describe "as HTML" do
      before do
        get :show, :id => @event.id
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "assigns the requested event to @event" do
        get :show, :id => @event.id
        assigns(:event).should eq(@event)
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
      it "creates a new event" do
        expect{
          post :create, event: FactoryGirl.attributes_for(:event)
        }.to change(Event,:count).by(1)
      end
      it "redirects to the new event" do
        post :create, event: FactoryGirl.attributes_for(:event)
        response.should redirect_to Event.last
      end
    end
    context "with invalid attributes" do
      it "does not save the new event" do
        expect{
          post :create, event: FactoryGirl.attributes_for(:invalid_event)
        }.to_not change(Event,:count)
      end
      it "re-renders the new method" do
        post :create, event: FactoryGirl.attributes_for(:invalid_event)
        response.should render_template :new
      end
    end
  end


  describe "GET 'edit'" do
    before do
      @event = FactoryGirl.create(:event)
    end

    describe "as HTML" do
      before do
        get :edit, :id => @event.id
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "assigns the requested event to @event" do
        get :edit, :id => @event.id
        assigns(:event).should eq(@event)
      end

      it "should render the edit template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "PUT 'update'" do
    before :each do
      @event = FactoryGirl.create(:event)
    end
    context "valid attributes" do
      it "located the requested @event" do
        put :update, id: @event, event: FactoryGirl.attributes_for(:event)
        assigns(:event).should eq(@event)
      end
      it "changes @event's attributes" do
        put :update, id: @event, event: FactoryGirl.attributes_for(:event, venue: "Somewhere Else")
        @event.reload
        @event.venue.should eq("Somewhere Else")
      end
      it "redirects to the updated event" do
        put :update, id: @event, event: FactoryGirl.attributes_for(:event)
        response.should redirect_to @event
      end
    end
    context "invalid attributes" do
      it "locates the requested @event" do
        put :update, id: @event, event: FactoryGirl.attributes_for(:invalid_event)
        assigns(:event).should eq(@event)
      end
      it "does not change @event's attributes" do
        put :update, id: @event, event: FactoryGirl.attributes_for(:event, city: nil)
        @event.reload
        @event.city.should_not eq(nil)
      end
      it "re-renders the edit method" do
        put :update, id: @event, event: FactoryGirl.attributes_for(:invalid_event)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @event = FactoryGirl.create(:event)
    end
    it "deletes the event" do
      expect{
        delete :destroy, id: @event
      }.to change(Event,:count).by(-1)
    end
    it "redirects to events#index" do
      delete :destroy, id: @event
      response.should redirect_to events_path
    end
  end


end











