/**
  		var serializedDOM = DataManager.__persistDOM(this.facade);
  		serializedDOM = '<?xml version="1.0" encoding="utf-8"?>' +
       	  '<html xmlns="http://www.w3.org/1999/xhtml" '    +
            'xmlns:b3mn="http://b3mn.org/2007/b3mn" '    +
            'xmlns:ext="http://b3mn.org/2007/ext" '    +
            'xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" '  +
            'xmlns:atom="http://b3mn.org/2007/atom+xhtml">'   +
          	'<head profile="http://purl.org/NET/erdf/profile">'   +
         	'<link rel="schema.dc" href="http://purl.org/dc/elements/1.1/" />' +
            '<link rel="schema.dcTerms" href="http://purl.org/dc/terms/ " />' +
            '<link rel="schema.b3mn" href="http://b3mn.org" />'   +
            '<link rel="schema.oryx" href="http://oryx-editor.org/" />'  +
            '<link rel="schema.raziel" href="http://raziel.org/" />'  +
       	  '</body></html>';
	    //convert to RDF
			new Ajax.Request(ORYX.CONFIG.AUTO_LAYOUTER_URL, {