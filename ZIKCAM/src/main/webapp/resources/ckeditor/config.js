/**
 * @license Copyright (c) 2003-2021, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	config.toolbarGroups = [
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		'/',
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];

	config.removeButtons = 'Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Flash';
	
	
	//WindowSize 
	config.height='460px';
	
	config.font_names = '굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;맑은 고딕/Malgun;Arial/arial;Comic Sans MS/comic;Courier New/cour;Georgia/georgia;Lucida Sans/LSANS;Tahoma/tahoma;Times New Roman/times;Trebuchet MS/trebuc;Verdana/verdana;';    // 사용 가능한 폰트 설정
	
	config.extraPlugins = 'youtube';
	
	config.youtube_responsive = true;
	
	config.youtube_related = false;
	
	
};
