module TextileEditor
  module Ext
    module ApplicationController

      def include_textile_editor_assets
        include_stylesheet('extensions/textile_editor/textile-editor') 
        include_javascript('extensions/textile_editor/textile-editor')
        include_javascript('extensions/textile_editor/textile-editor-radiant')
      end
    end
  end
end