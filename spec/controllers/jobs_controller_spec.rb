require 'rspec/rails'
require 'rails_helper'
require 'random_data'

RSpec.describe JobsController, type: :controller do
   let(:my_user) { User.create!(email: "user@blocipedia.com", password: "password") }
   let(:other_user) { User.create!(email: "other@blocipedia.com", password: "password") }
    let(:my_job) { Job.create!(user: my_user, address: "Address", yardsize: 100, specialrequests: "Special Requests", stripes: true, grasstreated: true, mulching: true, mulchexisting: true, newbushestrees: true, rate: 150, status: 0, paid: true, notes: "Notes") }

  

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: my_job.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, id: my_job.id
      expect(response).to render_template :show
    end
    
    it "assigns my_job to @job" do
      get :show, id: my_job.id
      expect(assigns(:job)).to eq(my_job)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the @new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @job" do
      get :new
      expect(assigns(:job)).not_to be_nil
    end
  end
  
  describe "POST create" do
    it "increases the number of Post by 1" do
      expect{ post :create, job: {user: my_user, address: "Address", yardsize: 100, specialrequests: "Special Requests", stripes: true, grasstreated: true, mulching: true, mulchexisting: true, newbushestrees: true, rate: 150, status: 0, paid: true, notes: "Notes" } }.to change(Job, :count).by(1)
    end

    it "assigns the new job to @job" do
      post :create, job: {user: my_user, address: "Address", yardsize: 100, specialrequests: "Special Requests", stripes: true, grasstreated: true, mulching: true, mulchexisting: true, newbushestrees: true, rate: 150, status: 0, paid: true, notes: "Notes" }
      expect(assigns(:job)).to eq Job.last
    end

    it "redirects to the new job" do
      post :create, job: {user: my_user, address: "Address", yardsize: 100, specialrequests: "Special Requests", stripes: true, grasstreated: true, mulching: true, mulchexisting: true, newbushestrees: true, rate: 150, status: 0, paid: true, notes: "Notes" }
      expect(response).to redirect_to [Job.last]
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: my_job.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, id: my_job.id
      expect(response).to render_template :edit
    end
    
    it "assigns job to be updated to @job" do
      get :edit, id: my_job.id
      job_instance = assigns(:job)
      
      expect(job_instance.id).to eq my_job.id
      expect(job_instance.user).to eq my_job.user
      expect(job_instance.address).to eq my_job.address
      expect(job_instance.yardsize).to eq my_job.yardsize
      expect(job_instance.date).to eq my_job.date
      expect(job_instance.specialrequests).to eq my_job.specialrequests
      expect(job_instance.stripes).to eq my_job.stripes
      expect(job_instance.grasstreated).to eq my_job.grasstreated
      expect(job_instance.mulching).to eq my_job.mulching
      expect(job_instance.mulchexisting).to eq my_job.mulchexisting
      expect(job_instance.newbushestrees).to eq my_job.newbushestrees
      expect(job_instance.rate).to eq my_job.rate
      expect(job_instance.status).to eq my_job.status
      expect(job_instance.paid).to eq my_job.paid
      expect(job_instance.notes).to eq my_job.notes
      
    end
  end
  
  describe "PUT update" do
    it "updates job with expected attributes" do
      new_address = "New Address"
      new_yardsize = 101
      #add test for date
      new_specialrequests = "New Special Requests"
      new_stripes = false
      new_grasstreated = false
      new_mulching = false
      new_mulchexisting = false
      new_newbushestrees = false
      new_rate = 151
      new_status = 2
      new_paid = false
      new_notes = "New Notes"
      
      put :update, id: my_job.id, job: {address: new_address, yardsize: new_yardsize, specialrequests: new_specialrequests, stripes: new_stripes, grasstreated: new_grasstreated, mulching: new_mulching, mulchexisting: new_mulchexisting, newbushestrees: new_newbushestrees, rate: new_rate, status: new_status, paid: new_paid, notes: new_notes}
      
      updated_job = assigns(:job)
      expect(updated_job.id).to eq my_job.id
      expect(updated_job.address).to eq new_address
      expect(updated_job.yardsize).to eq new_yardsize
      expect(updated_job.specialrequests).to eq new_specialrequests
      expect(updated_job.stripes).to eq new_stripes
      expect(updated_job.grasstreated).to eq new_grasstreated
      expect(updated_job.mulching).to eq new_mulching
      expect(updated_job.mulchexisting).to eq new_mulchexisting
      expect(updated_job.newbushestrees).to eq new_newbushestrees
      expect(updated_job.rate).to eq new_rate
      expect(updated_job.status).to eq new_status
      expect(updated_job.paid).to eq new_paid
      expect(updated_job.notes).to eq new_notes

    end
    
    it "redirects to the updated job" do
      new_address = "New Address"
      new_yardsize = 101
      #add test for date
      new_specialrequests = "New Special Requests"
      new_stripes = false
      new_grasstreated = false
      new_mulching = false
      new_mulchexisting = false
      new_newbushestrees = false
      new_rate = 151
      new_status = 2
      new_paid = false
      new_notes = "New Notes"
      
      put :update, id: my_job.id, job: {address: new_address, yardsize: new_yardsize, specialrequests: new_specialrequests, stripes: new_stripes, grasstreated: new_grasstreated, mulching: new_mulching, mulchexisting: new_mulchexisting, newbushestrees: new_newbushestrees, rate: new_rate, status: new_status, paid: new_paid, notes: new_notes}
      expect(response).to redirect_to my_job
    end
  end
  
  describe "DELETE destroy" do
    it "deletes the job" do
      delete :destroy, id: my_job.id
      count = Job.where({id: my_job.id}).size
      expect(count).to eq 0
    end
    
    it "redirects to Job index" do
      delete :destroy, id: my_job.id
      expect(response).to redirect_to jobs_path
    end
  end
end
