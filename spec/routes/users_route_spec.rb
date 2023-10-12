require 'rails_helper'

RSpec.describe SessionsController, type: :routing do
  describe 'route' do
    it 'routes to #create' do
      expect(post: '/users').to route_to({ 'controller' => 'registrations', 'action' => 'create' })
    end
  end
end
