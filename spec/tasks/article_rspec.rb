require 'rails_helper'
require 'rake'

Rails.application.load_tasks

describe Article do
  describe 'notify_new_article' do
    let(:service){instance_double(LatestArticleNotifier)}
    before do
      allow(LatestArticleNotifier).to receive(:new).and_return(service)
      expect(service).to receive(:call)
    end
    it 'success' do
      Rake::Task['article:notify_new_article'].invoke
    end
  end
end

