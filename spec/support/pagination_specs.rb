shared_examples "paginated_array" do

  it { expect(json).to have_key('meta') }
  it { expect(json['meta']).to have_key('pagination') }
  it { expect(json['meta']['pagination']).to have_key('per_page') }
  it { expect(json['meta']['pagination']).to have_key('total_pages') }
  it { expect(json['meta']['pagination']).to have_key('total_objects') }

end
