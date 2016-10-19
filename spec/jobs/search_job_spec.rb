require 'rails_helper'
RSpec.describe SearchJob, type: :job do
  include ActiveJob::TestHelper


  subject(:job) { described_class.perform_later({"all"=>{"term"=>""}, "artist"=>{"term"=>""}, "song"=>{"term"=>"Sorry"}, "album"=>{"term"=>""}}) }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in urgent queue' do
    expect(SearchJob.new.queue_name).to eq('urgent')
  end

  it 'executes perform' do
    expect_any_instance_of(Search).to receive(:execute)
    perform_enqueued_jobs { job }
  end


  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end