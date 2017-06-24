module FeatureHelpers
  include Warden::Test::Helpers
  
  def select2(value, **options)
    script = <<-JS
      $('select##{options[:from]}').siblings('.select2-container').find('.select2-selection').trigger('click')
    JS
    page.execute_script(script)
    find(".select2-results__option", text: value).click
  end

  def self.included(base)
    base.before(:each) { Warden.test_mode! }
    base.after(:each) { Warden.test_reset! }
  end

  def sign_in(resource)
    login_as(resource, scope: warden_scope(resource))
  end

  def sign_out(resource)
    logout(warden_scope(resource))
  end

  private

  def warden_scope(resource)
    resource.class.name.underscore.to_sym
  end
end
