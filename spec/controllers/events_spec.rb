require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET #index' do
    before { get events_path }

    it "is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    context 'when params[:search] is present' do
      let!(:event_starts_with_a) { create(:event, name: 'Aevent', event_type: :event_a, event_code: 'EventA')}
      let!(:event_starts_with_B) { create(:event, name: 'Bevent', event_type: :event_b, event_code: 'EventB')}
      let(:search_params) {
        {
          search: 'A'
        }
      }

      before { get events_path, params: search_params }

      it 'returns matching search results' do
        expect(response.body).to include("Aevent")
        expect(response.body).not_to include("Bevent")
      end
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) {
        {
          event: {
            name: 'Event A',
            event_type: :event_a,
            event_code: 'EVENTCODE',
          }
        }
      }

      before { post events_path, params: valid_params }

      it "is a success and is redirected" do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(assigns(:event))
      end
    end

    context 'with invalid params' do
      let(:invalid_params) {
        {
          event: {
            name: '',
            event_type: :event_a,
            event_code: 'EVENTCODE',
          }
        }
      }
      let(:event) { build(:event, name: '', event_type: :event_a, event_code: 'EVENTCODE') }

      before do
        post events_path, params: invalid_params
      end

      it "it returns redirect to '/events/new?event_type=A'" do
        expect(event).to be_invalid
        expect(response).to have_http_status(302)
        follow_redirect!
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #delete' do
    let(:event_to_delete) { create(:event, name: 'name', event_code: 'EVECODE', event_type: :event_a) }
    let(:valid_event_id) {
      {
        id: event_to_delete.id
      }
    }

    it 'deletes an event with a valid ID' do
      expect {
        delete events_url, params: valid_event_id
      }.to change{ Event.count }.by(1)
    end
  end

  describe 'PUT #update' do
    describe 'with valid params' do
      let(:event_to_update) { create(:event, name: 'name', event_code: 'EVECODE', event_type: :event_a) }
      let(:valid_params) {
        {
          event: {
            id: event_to_update.id,
            name: 'Updated event',
            event_type: :event_a,
            event_code: 'EVENTCODE',
          }
        }
      }

      before { patch event_path(event_to_update), params: valid_params }

      it 'successfully updates an event' do
        event_to_update.reload
        expect(event_to_update.name).to eq 'Updated event'
        expect(response).to have_http_status(302)
        follow_redirect!
        expect(response).to render_template(:show)
      end
    end
  end
end
