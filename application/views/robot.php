<?php error_reporting(0);
	if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	// error_reporting(0);
?>

<?php  $this->load->view('header.php'); ?>	
<link rel="stylesheet" href="<?php echo base_url() ?>assets/surukle_birak/css/style.css">

	



<div class="form-title-left"><a>Robot Txt</a></div>
<div class="y-n_r_">				
<form action="<?php echo base_url(); ?>yonetim/robot_al" method="POST">
<textarea name="rb" rows="20" cols="50" ><?php echo $icerik; ?></textarea><br>
<input type="submit" value="Kaydet">
</form>
</div>
  <!-- SURUKLE BIRAK -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/surukle_birak/js/jquery.knob.js"></script>
   <script src="<?php echo base_url(); ?>assets/surukle_birak/js/jquery.ui.widget.js"></script>
   <script src="<?php echo base_url(); ?>assets/surukle_birak/js/jquery.iframe-transport.js"></script>
   <script src="<?php echo base_url(); ?>assets/surukle_birak/js/jquery.fileupload.js"></script>
   <script src="<?php echo base_url(); ?>assets/surukle_birak/js/script.js"></script>
<?php  $this->load->view('footer.php'); ?>