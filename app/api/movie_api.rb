module MovieApi
  class API < Grape::API
    format :json
    content_type :json, 'application/json; charset=utf-8'

    get '' do
    	{
    		test: "start"
    	}
    end
  end
end