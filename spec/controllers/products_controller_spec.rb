require 'rails_helper'

# integration tests
# deep (hit the database)
# shallow (stub the database, stubbing the collaborating model)

describe ProductsController, type: :controller do
  
  describe '#index' do  #there would be quite a few tests here!
    before(:each) do
      @user = User.create!(name: 'SUNY Tester', email: 'stester@binghamton.edu')
      @auth = Authorization.create!(provider: "github", uid: "123456", user_id: @user.id)
      session[:user_id] = @user.id      
      @current_user = @user      
    end 
    let(:product1) {instance_double('Product', productcode: '12345', title: 'iphone', originalprice: '400$', offer: '40% discount', status: 'available')}
    let(:product2) {instance_double('Product', productcode: '67890', title: 'Heater', originalprice: '400$', offer: '40% discount', status: 'available')}
    let(:product3) {instance_double('Product', productcode: '12121', title: 'SUn glasses', originalprice: '400$', offer: '40% discount', status: 'available')}
    let(:products) { [product1, product2, product3] }
    it 'Retrieves all of the products' do
      allow(Product).to receive(:all).and_return([product1, product2, product3])
      get :index
      expect(assigns(:products)).to eq(products)
    end
  end
  describe '#new' do
    before(:each) do
      @user = User.create!(name: 'SUNY Tester', email: 'stester@binghamton.edu')
      @auth = Authorization.create!(provider: "github", uid: "123456", user_id: @user.id)
      session[:user_id] = @user.id      
      @current_user = @user      
    end     
    it 'selects the new template for rendering' do
      get :new
      expect(response).to render_template('new')
    end
  end  
  describe '#create' do
    before(:each) do
      @user = User.create!(name: 'SUNY Tester', email: 'stester@binghamton.edu')
      @auth = Authorization.create!(provider: "github", uid: "123456", user_id: @user.id)
      session[:user_id] = @user.id      
      @current_user = @user      
    end 
    let(:params) { {productcode: '12345', title: 'iphone', originalprice: '400$', offer: '40% discount', status: 'available'} }
    let(:product) { instance_double('Product', params)}
    let(:id1) {'1'}
    it 'Creates a new product' do
      expect(Product).to receive(:create!).with(params).and_return(product)
      post :create, product: params
    end
    it 'Sets a flash message' do
      allow(Product).to receive(:create!).with(params).and_return(product)
      post :create, product: params
      expect(flash[:notice]).to match(/^.* was successfully created.$/)  
    end
    it 'Redirects to the product page' do
      allow(Product).to receive(:create!).with(params).and_return(product)
      post :create, product: params
      expect(response).to redirect_to(products_path)
    end
  end
  describe '#show' do
    before(:each) do
      @user = User.create!(name: 'SUNY Tester', email: 'stester@binghamton.edu')
      @auth = Authorization.create!(provider: "github", uid: "123456", user_id: @user.id)
      session[:user_id] = @user.id      
      @current_user = @user      
    end
    let(:product1) {instance_double('Product', productcode: '12345', title: 'iphone', originalprice: '400$', offer: '40% discount', status: 'available')}
    let(:id1) {'1'}
    it 'Retrieves the product' do
      expect(controller).to receive(:set_product).and_return(product1)
      get :show, id: id1 
    end
    it 'selects the show template for rendering' do
      allow(controller).to receive(:set_product).and_return(product1)
      get :show, id: id1 
      expect(response).to render_template('show')  
    end
    it 'makes the product available to the template' do
      allow(controller).to receive(:set_product).and_return(product1)
      get :show, id: id1 
      expect(assigns(:product)).to eq(product1)
    end
  end
  describe '#edit' do
    before(:each) do
      @user = User.create!(name: 'SUNY Tester', email: 'stester@binghamton.edu')
      @auth = Authorization.create!(provider: "github", uid: "123456", user_id: @user.id)
      session[:user_id] = @user.id      
      @current_user = @user      
    end
    let(:id1) {'1'}
    let(:product){instance_double('Product', productcode: '12345', title: 'iphone', originalprice: '400$', offer: '40% discount', status: 'available')}
    it 'Retrieves the product' do
      expect(controller).to receive(:set_product).and_return(product)
      get :edit, id: id1 
    end
    it 'selects the Edit template for rendering' do
      allow(controller).to receive(:set_product).and_return(product)
      get :edit, id: id1 
      expect(response).to render_template('edit') 
    end
    it 'makes the product available to the template' do
      allow(controller).to receive(:set_product).and_return(product)
      get :edit, id: id1 
      expect(assigns(:product)).to eq(product)
    end
  end
  describe '#destroy' do
    before(:each) do
      @user = User.create!(name: 'SUNY Tester', email: 'stester@binghamton.edu')
      @auth = Authorization.create!(provider: "github", uid: "123456", user_id: @user.id)
      session[:user_id] = @user.id      
      @current_user = @user      
    end
    let(:id1) {'1'}
    let(:product) {instance_double('Product', productcode: '12345', title: 'iphone', originalprice: '400$', offer: '40% discount', status: 'available')}
    it 'Retrieves the product' do
      expect(controller).to receive(:set_product).and_return(product)
      allow(product).to receive(:destroy)
      delete :destroy, :id => id1
    end    
    it 'Calls the destroy method to delete the product' do
      allow(controller).to receive(:set_product).and_return(product)
      expect(product).to receive(:destroy)
      delete :destroy, :id => id1
    end
    it 'Sets the flash message' do
      allow(controller).to receive(:set_product).and_return(product)
      allow(product).to receive(:destroy)
      delete :destroy, :id => id1
      expect(flash[:notice]).to match(/^Product \'[^']*\' deleted.$/)  
    end
    it 'Redirects to the products page' do
      allow(controller).to receive(:set_product).and_return(product)
      allow(product).to receive(:destroy)
      delete :destroy, :id => id1
      expect(response).to redirect_to(products_path)
    end
  end
  describe '#update' do
    before(:each) do
      @user = User.create!(name: 'SUNY Tester', email: 'stester@binghamton.edu')
      @auth = Authorization.create!(provider: "github", uid: "123456", user_id: @user.id)
      session[:user_id] = @user.id      
      @current_user = @user      
    end
    let(:params) { {productcode: '12345', title: 'iphone', originalprice: '400$', offer: '40% discount', status: 'available'} }
    let(:product) { instance_double('Product', params)}
    let(:id1) {'1'}
    let(:updated){ instance_double('Product', title: 'Samsung', originalprice: '400$', offer: '40% discount', status: 'available') }
    it 'Retrieves the product' do
      expect(controller).to receive(:set_product).and_return(product)
      allow(product).to receive(:update_attributes!).with(params)
      put :update, id: id1, product: params
    end
    it 'Updates the product attributes' do
      allow(controller).to receive(:set_product).and_return(product)
      expect(product).to receive(:update_attributes!).with(params).and_return(updated)
      put :update, id: id1, product: params
    end
    it 'Sets a flash message' do
      allow(controller).to receive(:set_product).and_return(product)
      allow(product).to receive(:update_attributes!).with(params).and_return(updated)
      put :update, id: id1, product: params
      expect(flash[:notice]).to match(/^.* was successfully updated.$/)  
    end
    it 'Redirects to the products page' do
      allow(controller).to receive(:set_product).and_return(product)
      allow(product).to receive(:update_attributes!).with(params).and_return(updated)
      put :update, id: id1, product: params
      expect(response).to redirect_to(product_path(product))
    end
  end
end
