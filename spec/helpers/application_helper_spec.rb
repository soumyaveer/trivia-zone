describe ApplicationHelper do
  describe '#form_group_error_class_for' do
    it 'returns errors if record had errors' do
      user = User.new
      user.errors[:email] << 'Invalid email address'
      expect(helper.form_group_error_class_for(user, :email)).to eql('has-error')
    end

    it 'returns blank string incase of no errors' do
      user = User.new
      expect(helper.form_group_error_class_for(user, :email)).to eql('')
    end
  end
end

