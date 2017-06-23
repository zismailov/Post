module FeatureHelpers
  def select2(value, **options)
    script = <<-JS
      $('select##{options[:from]}').siblings('.select2-container').find('.select2-selection').trigger('click')
    JS
    page.execute_script(script)
    find(".select2-results__option", text: value).click
  end
end
