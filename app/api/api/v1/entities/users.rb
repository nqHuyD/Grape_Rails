module API
  module V1
    module Entities
      class Users < Grape::Entity
        format_with(:iso_timestamp) do |date|
          date.iso8601
        end

        expose :profile do
          expose :id, as: :key
          expose :name, documentation: {type: "String", desc: "Status update text."}
        end

        with_options(format_with: :iso_timestamp) do
          expose :created_at
        end
      end
    end
  end
end