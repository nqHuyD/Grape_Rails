module API  
  module V1
    module Helper
      module SharedParams
        extend Grape::API::Helpers
        params :id  do
          requires :id, type: String, desc: "ID of the User"
        end
      end
    end
  end
end
