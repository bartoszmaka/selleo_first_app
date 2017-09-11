module Features
  module SessionHelper
    def log_in(role = 'admin', mail = 'test@rspec.com')
      user = create(:admin, email: mail, role: role)
      visit new_user_session_path
      fill_in 'Email', with: 'test@rspec.com'
      fill_in 'Password', with: '123123'
      click_button 'Sign in'
      user
    end

    def fill_in_ckeditor(locator, opts)
      content = opts.fetch(:with).to_json
      page.execute_script <<-SCRIPT
     CKEDITOR.instances['#{locator}'].setData(#{content});
     $('textarea##{locator}').text(#{content});
      SCRIPT
    end
  end
end
