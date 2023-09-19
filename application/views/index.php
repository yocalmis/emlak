
<?php  $this->load->view('header.php'); ?>

	<style type="text/css">
	
	<?php if( ($this->session->userdata('ln')=="ar") or ($this->session->userdata('ln')=="frs") ) {?>
	
	
	
		
	<?php } ?>
	</style>

<?php if($data['side_menu']==""){ ?>
	<div class="header-edit">

</div>
<?php } ?>



<div>

<br><br>
</div>
<?php 
$this->load->view('hizlimenu_json.php'); 
 ?>

			<?php echo $output; ?>



			<?php  $this->load->view('footer.php'); ?>	
			
			
			
		<script>

/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// https://ckeditor.com/docs/ckeditor4/latest/api/CKEDITOR_config.html

	// The toolbar groups arrangement, optimized for two toolbar rows.
	config.toolbarGroups = [
		{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
		{ name: 'links' },
		{ name: 'insert' },
		{ name: 'forms' },
		{ name: 'tools' },
		{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'others' },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
		{ name: 'styles' },
		{ name: 'colors' },
		{ name: 'about' }
	];

	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
	config.removeButtons = 'Underline,Subscript,Superscript';

	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';

	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	
    
  //    config.language = 'tr';
  
  	<?php if($this->session->userdata('ln')=="ar") {?>
	// config.language = 'ar';
	config.language = 'tr';
	
	<?php } ?>
  
  	<?php if($this->session->userdata('ln')=="frs") {?>
	//config.language = 'ar';
		config.language = 'ru';
	//config.defaultLanguage = 'ru';
	<?php } ?>
  
	
	
};






</script>		










