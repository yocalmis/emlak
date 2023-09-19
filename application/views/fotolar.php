<?php error_reporting(0);
	if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	// error_reporting(0);
?>

<?php  $this->load->view('header.php'); ?>	
<link rel="stylesheet" href="<?php echo base_url() ?>assets/surukle_birak/css/style.css">

	

<script type="text/javascript">

	function etiket(n){


	var alt = $("#alt_"+n).val();
	var title = $("#title_"+n).val();
    kayit(alt,title,n);


	}

	function kayit(a,b,c){
		
	veriler="alt="+a+"&title="+b+"&id="+c;

	$.ajax({ 
type: "POST", 
url: "<?php echo base_url(); ?>yonetim/eti_kyt", 
data: veriler, 
success:function(cevap){ 

    $("#alt_"+c).val(a);
    $("#title_"+c).val(b);
	alert(cevap);
} 
})		
	}


	function kontrolet(){

		//var ep=$('#ep').val();  
		var bas=$('#bas').val(); 
		var ice=$('#ice').val();
	
		if( (bas=='') || (ice=='') ){ 

			//	if(ep==''){$("#ep").css("background-color","#66CCFF");}else{$("#ep").css("background-color","#FFFFFF"); }
			if(bas=='') {
				$("#bas").css("background-color","#66CCFF");
			}
			else {
				$("#bas").css("background-color","#FFFFFF"); 
			}
			if(ice=='') {
				$("#ice").css("background-color","#66CCFF");
			}
			else {
				$("#ice").css("background-color","#FFFFFF"); 
			}

		}
		else { 
			$('#myform').removeAttr("onsubmit"); 
		}
				
	}

	function kontrolet_2(){

		var ep=$('#sms').val();  
		var ice=$('#ice_sms').val();		

		if (ice=='') { 
			if(ice=='') {
				$("#ice").css("background-color","#66CCFF");
			}
			else {
				$("#ice").css("background-color","#FFFFFF"); 
			}

		}
		else { 

			$('#myform_2').removeAttr("onsubmit"); 

		}
			
	}

</script>			



<div class="form-title-left"><a><?php echo $s_adi; ?> projesine ait resimler</a></div>

<form id="upload" method="post" action="<?php echo base_url(); ?>yonetim/fotolar_upload" enctype="multipart/form-data">
	<div id="drop">
		Sürükle 
		<a>Aç</a>
		<span>Resim Büyüklükleri  <?php if($id!=0){echo"1320*583";} ?></span>
		<input type="file" name="upl" multiple />
		<input type="hidden" name="id" value="<?php echo $id; ?>"/>		
		<input type="hidden" name="adi" value="<?php echo $s_adi; ?>"/>	
		<input type="hidden" name="kod" value="<?php echo $kod; ?>"/>	
	</div>

	<ul><!-- The file uploads will be shown here --></ul>
	<button class="y_r_y_b">Yükle</button>
</form>




<div class="y-n_r_">				
	<?php $n=0; if( $foto ) :  foreach( $foto  as $dizi ) : ?>	
		<div class="y_r_">
<a href="<?php echo base_url(); ?>assets/resimler/<?php  echo $dizi['foto']; ?>">
<style>
#zoom:hover {
	z-index:1;
	position:relative;
  transform: scale(2); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
}
</style>
		<center>	<img style="width:25%; position:relative;" id="zoom" src="<?php echo base_url(); ?>assets/resimler/<?php  echo $dizi['foto']; ?>">
				<br><a href="<?php echo base_url(); ?>yonetim/foto_sil/<?php  echo $id; ?>/<?php  echo $s_adi; ?>/<?php  echo $dizi['id']; ?>/<?php  echo $dizi['proje_id']; ?>/<?php  echo $dizi['foto']; ?>"><i>Sil</i></a>
			<br><input type="text" name="alt" id="alt_<?php echo $dizi['id']; ?>" value="<?php echo $dizi['alt']; ?>" placeholder="Alt Etiketi">
			<input type="text" name="title" id="title_<?php echo $dizi['id']; ?>" value="<?php echo $dizi['title']; ?>" placeholder="Title Etiketi">
           <input type="submit" onclick="etiket(<?php echo $dizi['id']; ?>);" placeholder="Etiketleri Güncelle">			
		</center><br><br>
</a>


		</div>

	<?php $n=$n+1; endforeach;  endif; ?>
	<div id="et_snc"></div>
</div>
  <!-- SURUKLE BIRAK -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/surukle_birak/js/jquery.knob.js"></script>
   <script src="<?php echo base_url(); ?>assets/surukle_birak/js/jquery.ui.widget.js"></script>
   <script src="<?php echo base_url(); ?>assets/surukle_birak/js/jquery.iframe-transport.js"></script>
   <script src="<?php echo base_url(); ?>assets/surukle_birak/js/jquery.fileupload.js"></script>
   <script src="<?php echo base_url(); ?>assets/surukle_birak/js/script.js"></script>
<?php  $this->load->view('footer.php'); ?>