# -*- encoding : utf-8 -*-
theme_name = File.split(File.expand_path("../..", __FILE__))[1]
theme_name.gsub!('-', '_')
THEME_NAME = theme_name
# If not already created, make a CensorRule that hides personal information
regexp = '={67}\s*\n(?:[^\n]*?#[^\n]*?: ?[^\n]*\n){3,10}[^\n]*={67}'

unless CensorRule.find_by_text(regexp)
  Rails.logger.info("Creating new censor rule: /#{regexp}/")
  CensorRule.create!(:text => regexp,
                     :allow_global => true,
                     :replacement => _('REDACTED'),
                     :regexp => true,
                     :last_edit_editor => THEME_NAME,
                     :last_edit_comment => 'Added automatically')
end
