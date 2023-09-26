module RequestSpecHelper
    include Warden::Test::Helpers


    def self.include(base)
        base.before(:each) do {Warden.test_model}
        base.after(:each) do {Warden.test_reset!}
    end

    def sign_in(resource)
        login_as(resource, scope: warden_scope(resource))
        resource
    end

    def sign_out(resource)
        logout(warden_scope(resource))
    end

    def json 
        JSON.parse(response.body).with_indifferent_access
    end

    private
    def warden_scope(resource)
        resource.class.name.underscore.to_sym
    end
end

Rspec.configure do |config|
    config.include RequestSpecHelper, type: :request
    config.before(:each, type: :request) (host: "localhost:3000")
end