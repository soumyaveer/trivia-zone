describe User do
  describe 'validations' do
    let(:user) { User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'testpass123')}

    it 'should fail validation if user\'s name is not present' do
      user.name = nil
      expect(user.valid?).to eql(false)
      expect(user.errors[:name]).to be_present
    end

    it 'should fail validation if user\'s email is not present' do
      user.email = nil

      expect(user.valid?).to eql(false)
      expect(user.errors[:email]).to be_present
    end

    it 'should fail validation is password is not present' do
      user.password = nil

      expect(user.valid?).to eql(false)
      expect(user.errors[:password]).to be_present
    end

    it 'should pass validation is all the attributes are present' do
      expect(user.valid?).to eql(true)
    end
  end
end
