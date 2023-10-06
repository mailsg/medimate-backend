require 'rails_helper'

RSpec.describe Api::V1::AppointmentsController, type: :routing do
  describe 'route' do
    it 'routes to #index' do
      expect(get: '/api/v1/appointments').to route_to({ 'format' => 'json', 'controller' => 'api/v1/appointments',
                                                        'action' => 'index' })
    end

    it 'routes to #create' do
      expect(post: 'api/v1/appointments').to route_to({ 'format' => 'json', 'controller' => 'api/v1/appointments',
                                                        'action' => 'create' })
    end

    it 'routes to #destroy' do
      expect(delete: 'api/v1/appointments/1').to route_to({ 'format' => 'json', 'controller' => 'api/v1/appointments',
                                                            'action' => 'destroy', 'id' => '1' })
    end
  end
end
