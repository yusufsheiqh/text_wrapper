RSpec.describe TextWrapper do
  it 'has a version number' do
    expect(TextWrapper::VERSION).not_to be nil
  end

  it 'outputs an empty string when called with nothing' do
    expect(TextWrapper.wrap('', 1)).to eq('')
  end

  it 'outputs the word if shorter than the length' do
    expect(TextWrapper.wrap('word', 5)).to eq('word')
  end

  it 'splits a long word on the length column' do
    expect(TextWrapper.wrap('longword', 4)).to eq("long\nword")
  end

  it 'splits a really long word on the column' do
    expect(TextWrapper.wrap('longlongword', 4)).to eq("long\nlong\nword")
  end

  it 'splits a word on a whitespace' do
    expect(TextWrapper.wrap('long word', 5)).to eq("long\nword")
  end

  it 'splits a whitespace that is after the column' do
    expect(TextWrapper.wrap('long word', 4)).to eq("long\nword")
  end

  it 'splits early when the space is before column' do
    expect(TextWrapper.wrap('long word', 6)).to eq("long\nword")
  end

  it 'keeps as many words on the line as possible' do
    expect(TextWrapper.wrap('long long word', 10)).to eq("long long\nword")
  end
end
