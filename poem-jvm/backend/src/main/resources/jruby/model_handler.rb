module Handler
  class ModelHandler < DefaultHandler
    def doGet(interaction)
      representation = interaction.object.read
      interaction.response.setStatus(200)
      out = interaction.response.getWriter
      interaction.response.setContentType "application/xhtml+xml"
      
      oryx_path = '/oryx/'
    	out.println("<?xml version=\"1.0\" encoding=\"utf-8\"?>")
    	out.println("<html xmlns=\"http://www.w3.org/1999/xhtml\"")
    	out.println("xmlns:b3mn=\"http://b3mn.org/2007/b3mn\"")
    	out.println("xmlns:ext=\"http://b3mn.org/2007/ext\"")
    	out.println("xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"")
    	out.println("xmlns:atom=\"http://b3mn.org/2007/atom+xhtml\">")
    	out.println("<head profile=\"http://purl.org/NET/erdf/profile\">")
    	out.println("<title>" + representation.getTitle + " - Oryx</title>")
    	out.println("<!-- libraries -->")
    	out.println("<script src=\"" + oryx_path + "lib/prototype-1.5.1_rc3.js\" type=\"text/javascript\" />")
    	out.println("<script src=\"" + oryx_path + "lib/path_parser.js\" type=\"text/javascript\" />")
    	out.println("<script src=\"" + oryx_path + "lib/ext-2.0.2/adapter/yui/yui-utilities.js\" type=\"text/javascript\" />")
    	out.println("<script src=\"" + oryx_path + "lib/ext-2.0.2/adapter/yui/ext-yui-adapter.js\" type=\"text/javascript\" />")
    	out.println("<script src=\"" + oryx_path + "lib/ext-2.0.2/ext-all.js\" type=\"text/javascript\" />")
    	out.println("<script src=\"" + oryx_path + "lib/ext-2.0.2/color-field.js\" type=\"text/javascript\" />")
    	out.println("<style media=\"screen\" type=\"text/css\">")
    	out.println("@import url(\"" + oryx_path + "lib/ext-2.0.2/resources/css/ext-all.css\");")
    	out.println("@import url(\"" + oryx_path + "lib/ext-2.0.2/resources/css/xtheme-gray.css\");")
    	out.println("</style>")

    	out.println("<script src=\"" + oryx_path + "shared/kickstart.js\" type=\"text/javascript\" />")
    	out.println("<script src=\"" + oryx_path + "shared/erdfparser.js\" type=\"text/javascript\" />")
    	out.println("<script src=\"" + oryx_path + "shared/datamanager.js\" type=\"text/javascript\" />")
    	out.println("<!-- oryx editor -->")
    	out.println("<script src=\"" + oryx_path + "oryx.js\" type=\"text/javascript\" />")
    	out.println("<link rel=\"Stylesheet\" media=\"screen\" href=\"" + oryx_path + "css/theme_norm.css\" type=\"text/css\" />")

    	out.println("<!-- erdf schemas -->")
    	out.println("<link rel=\"schema.dc\" href=\"http://purl.org/dc/elements/1.1/\" />")
    	out.println("<link rel=\"schema.dcTerms\" href=\"http://purl.org/dc/terms/\" />")
    	out.println("<link rel=\"schema.b3mn\" href=\"http://b3mn.org\" />")
    	out.println("<link rel=\"schema.oryx\" href=\"http://oryx-editor.org/\" />")
    	out.println("<link rel=\"schema.raziel\" href=\"http://raziel.org/\" />")
    	out.println("</head>")
    	
    	out.println("<body style=\"overflow:hidden;\"><div class='processdata' style='display:none'>")
    	out.println(representation.getContent)
    	out.println("</div>")
    	out.println("<div class='processdata'></div>")
    	out.println("</body>")
    	out.println("</html>")
    end

    def doPut(interaction)
      representation = interaction.object.read
      representation.setContent(interaction.params['data'])
      representation.update
      interaction.response.setStatus(200)
    end

    def doPost(interaction)
      representation = interaction.object.read
      puts interaction.params['data']
      representation.setContent(interaction.params['data'])
      representation.update
      interaction.response.setStatus(200)
    end
    
    def doDelete(interaction)
      interaction.object.delete
      interaction.response.setStatus(200)
    end
  end
end