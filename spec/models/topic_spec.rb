describe Topic do
  describe 'validations' do
    let(:topic) do
      Topic.create( name: "Game of Thrones")
    end

    it 'should fail validation if name is not present' do
      topic.name = nil

      expect(topic.valid?).to eql(false)
      expect(topic.errors[:name]).to be_present
    end

    it 'should fail validation if name is not unique' do
      new_topic = Topic.create
      new_topic.name = "Game of Thrones"

      expect(new_topic.errors[:name]).to be_present
    end

    it 'should pass validation with correct attributes' do
      expect(topic.valid?).to eql(true)
      expect(topic.errors[:name]).not_to be_present
    end
  end
end
