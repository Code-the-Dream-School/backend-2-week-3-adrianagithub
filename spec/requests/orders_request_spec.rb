require 'rails_helper'

RSpec.describe "Orders", type: :request do
    describe "get orders_path" do
        it "renders the index view" do
          FactoryBot.create_list(:order, 10)
          get orders_path
          expect(response.status).to eq(200)
        end
    end
    describe "get order_path" do
        it "renders the :show template" do
          order = FactoryBot.create(:order)
          get order_path(id: order.id)
          expect(response.status).to eq(200)
        end
        it "redirects to the index path if the order id is invalid" do
          get order_path(id: 5000) #an ID that doesn't exist
          expect(response).to redirect_to orders_path
        end
    end
    describe "get new_order_path" do
        it "renders the :new template" do
          get new_order_path
          expect(response).to be_successful
          expect(response).to render_template(:new)
        #post '/pages', to 'pages#create"
        end
      end
      describe "get edit_order_path" do
        it "renders the :edit template" do
          # edit_customer_path	GET	/customers/:id/edit(.:format)	customers#edit
          order = FactoryBot.create(:order)
          get edit_order_path(id: order.id)
          expect(response.status).to eq(200)
        end
        it "redirects to the index path if the customer id is invalid" do
          get order_path(id: 5000) #an ID that doesn't exist
          expect(response).to redirect_to orders_path
        end  
        #get '/pages/:id/edit', to:'pages#edit'
      end
      describe "post orders_path with valid data" do
        it "saves a new entry and redirects to the show path for the entry" do
          order_attributes = FactoryBot.attributes_for(:order)
          expect { post orders_path, params: {order: order_attributes}
        }.to change(Order, :count)
          expect(response).to redirect_to order_path(id: Order.last.id)
        end
      end

      describe "post orders_path with invalid data" do
        it "does not save a new entry or redirect" do
          order_attributes = FactoryBot.attributes_for(:order)
          order_attributes.delete(:product_name)
          expect { post orders_path, params: {order: order_attributes}
        }.to_not change(Order, :count)
          expect(response.status).to eq(200)
        end
      end  
      describe "put order_path with valid data" do
        it "updates an entry and redirects to the show path for the order" do     
          order = FactoryBot.create(:order) #create or build
          put order_path(id: order.id), params: {order:{product_name: "pen"}}
          order.reload
          expect(order.product_name).to eq("pen")
          expect(response).to redirect_to order_path(id: order.id)
        end
      end
      describe "put order_path with invalid data" do
          it "updates an entry and redirects to the show path for the order" do     
          order = FactoryBot.create(:order) #create or build
          put order_path(id: order.id), params: {order: {product_name: ""}}
          order.reload
          expect(order.product_name).to_not eq("nil")
          expect(response.status).to eq(200)
        end
      end
      describe "delete an order record" do
        it "deletes an order record" do
            order = FactoryBot.create(:order)
          delete order_path(id: order.id), params: {order:{product_name: "pen"}}
          #expect(response).to have_http_status(:success)
          expect { delete orders_path(id: order.id).to eq("pen")}
        end
      end
end
