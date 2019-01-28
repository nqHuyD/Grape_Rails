module API  
  module V1
    class Users < Grape::API
      helpers API::V1::Helper::SharedParams
      include API::V1::Defaults
      
      resource :users do
        desc "Return all Users"
        get "", root: :users do
          @users = User.all
          present @users, with: API::V1::Entities::Users
        end

        desc "Return a User"
        params do
          use :id
        end

        route_param :id do
          get do
            @user = User.where(id: permitted_params[:id]).first!
            present @user, with: API::V1::Entities::Users
          end
        end

        desc "Return all Post By User"
        resource :posts do
          route_param :id do
            get do
              User.find(permitted_params[:id]).posts
            end
          end
        end
      end
    end
  end
end  