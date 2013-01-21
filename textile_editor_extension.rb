# Uncomment this if you reference any of your controllers in activate
require_dependency 'application_controller'
require "radiant-textile_editor-extension"

class TextileEditorExtension < Radiant::Extension
  version RadiantTextileEditorExtension::VERSION
  description RadiantTextileEditorExtension::DESCRIPTION
  url RadiantTextileEditorExtension::URL
  
  def activate
    ApplicationController.send :include, TextileEditor::Ext::ApplicationController
    Admin::PagesHelper.send :include, TextileEditor::Ext::Admin::PagesHelper
    Page.send :include, TextileEditor::PageExtensions
    [Admin::PagesController, Admin::SnippetsController].each do |c| 
      c.send :before_filter, :include_textile_editor_assets
    end
    [:pages, :snippet].each do |controller|
      admin.send(controller).edit.add :main, 'admin/pages/link_popup'
      admin.send(controller).edit.add :main, 'admin/pages/image_popup'
    end
  end
  
  def deactivate
  end
  
end
