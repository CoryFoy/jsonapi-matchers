module Jsonapi
  module Matchers
    module Shared
      def normalize_target(target)
        if target.is_a?(::ActionController::TestResponse)
          begin
            JSON.parse(target.body).with_indifferent_access
          rescue => e
            @failure_message = "Expected response to be json string but was #{target.body.inspect}. #{e.class} - #{e.message}"
            return
          end
        elsif target.is_a?(Hash)
          return target.with_indifferent_access
        else
          @failure_message = "Expected response to be ActionController::TestResponse or hash but was #{target.inspect}"
          return
        end
      end
    end
  end
end
