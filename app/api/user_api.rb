module UserApi
  class API < Grape::API
    format :json
    content_type :json, 'application/json; charset=utf-8'


    post 'signin' do
    	begin
            @user = User.find_by_email_and_password(params[:email], params[:password])
            raise ActiveRecord::RecordNotFound unless  @user
            env['rack.session'][:user_id] = @user.id
            status 200
        rescue
            status 404
        end

    end

    post 'sigup' do
        begin
            @user = User.create(email: params[:email], password: params[:password])
            status 200
        rescue
            status 404
        end
    end
  end
end