require 'spec_helper'

describe EventController do

  describe "GET 'index'" do
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

  describe "GET 'destroy'" do
    before do
      FactoryGirl.create_list(:event, 3)
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

  describe "GET 'edit'" do
    before do
      FactoryGirl.create_list(:event, 3)
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
      FactoryGirl.create_list(:event, 3)
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


end
