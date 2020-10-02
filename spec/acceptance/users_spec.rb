resource 'Users' do
  header 'Content-Type', 'application/json'
  header 'access-token', :access_token_header
  header 'client', :client_header
  header 'uid', :uid_header

  let(:user) { create(:user) }

  route 'api/v1/users', 'Create User' do
    let(:request) { { user: attributes_for(:user) } }

    post 'Create' do
      example 'Ok' do
        do_request(request)

        expect(status).to eq 200
      end
    end
  end

  route 'api/v1/user', 'Show User' do
    get 'Show' do
      example 'Ok' do
        do_request

        expect(status).to eq 200
      end
    end
  end

  route 'api/v1/user', 'Update User' do
    let(:request) { { user: { username: 'new username' } } }

    put 'Update' do
      example 'Ok' do
        do_request(request)

        expect(status).to eq 200
      end
    end
  end
end
