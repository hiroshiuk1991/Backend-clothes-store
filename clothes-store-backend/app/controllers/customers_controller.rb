class CustomersController < ApplicationController

    def show
        customer = Customer.find(params[:id])
        render json: {id: customer.id, username: customer.username, email: customer.email, password: customer.password}
    end

    def create 
        customer = Customer.create(customer_params)
    end 

    def destroy
        Customer.destroy(params[:id])
    end 

    def update 
        customer = Customer.find(params[:id])
    end 


    def sign_in
        customer = Customer.find_by(username: params[:username])
        if customer and customer.authenticate(params[:password])
            render json: customer 
        else 
            render json:{error: 'Username/Password invalid'}, status: 403    
        end 
    end 

    def validate 
        request.headers['Authorization']
    end





    private

    def customer_params
        params.require(:customer).permit(:username, :email, :password)
    end 


end
