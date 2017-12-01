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

  describe 'nav_status' do
    it 'returns active if current navbar item matches the navbar item' do
      @current_nav_item = :test

      expect(helper.nav_status(:test)).to eql('active')
    end

    it 'returns inactive if current navbar item does not match the navbar item' do
      @current_nav_item = :something_else

      expect(helper.nav_status(:test)).to eql('inactive')
    end
  end
end

