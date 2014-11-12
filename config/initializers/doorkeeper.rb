Doorkeeper.configure do
  orm :active_record
  resource_owner_authenticator do
    current_user || warden.authenticate!(:scope => :user)
  end
  admin_authenticator do
    current_user || warden.authenticate!(:scope => :user)
  end
  default_scopes  :public
  optional_scopes :write, :update
end
