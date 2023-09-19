<footer>

  <div class="fo1">
  
  <div class="container">
    <div class="row">
      <div class="col-lg-3 col-6">
        <ul class="bold fomen">
        <li><a title="en" href=""><?php echo $this->session->userdata('home'); ?></a></li>
        <li><a  title="ABOUT" href="about"><?php echo $this->session->userdata('menu_2'); ?></a></li>
        <li><a title="BUYER GUIDE" href="buyer_guide"><?php echo $this->session->userdata('menu_3'); ?></a></li>
        <li><a  title="NEWS" href="news"><?php echo $this->session->userdata('menu_4'); ?></a></li>
        <li><a  title="CONTACT" href="contact"><?php echo $this->session->userdata('menu_5'); ?></a></li>
        </ul>
      </div>

            <div class="col-lg-3 col-6">
        <ul class="fomen">
        <div class="bold fo1-1"><?php echo $this->session->userdata('footer_1'); ?></div>
		
				   <?php       if ($proje_kat): foreach ($proje_kat as $dizi): ?>  
	         <li>       <a  title="<?php echo $dizi["kategori_adi"]; ?>" href="<?php echo $dizi["seo_adi"]; ?>"><?php echo $dizi["kategori_adi"]; ?></a> </li>
					<?php  	   endforeach;endif;  ?>    
        </ul>
      </div>

            <div class="col-lg-3 col-6">
        <ul class="fomen">
          <div class="bold fo1-1"><?php echo $this->session->userdata('footer_2'); ?></div>
        <li><a  title="<?php echo $this->session->userdata('buyer_guide_kucuk'); ?>" href="buyer_guide"><?php echo $this->session->userdata('buyer_guide_kucuk'); ?></a></li>
		
	   <?php       if ($haber_kat): foreach ($haber_kat as $dizi): ?>  
	         <li>       <a title="<?php echo $dizi["kategori_adi"]; ?>" href="<?php echo $dizi["seo_adi"]; ?>"><?php echo $dizi["kategori_adi"]; ?></a> </li>
					<?php  	   endforeach;endif;  ?>  	

        </ul>
      </div>

            <div class="col-lg-3 col-6">
        <ul class="fomen">
          <div class="bold fo1-1"><?php echo $this->session->userdata('footer_3'); ?></div>
		  
	   <?php       if ($linkler): foreach ($linkler as $dizi): ?>  
	         <li>       <a title="<?php echo $dizi["adi"]; ?>" href="<?php echo $dizi["link"]; ?>"><?php echo $dizi["adi"]; ?></a> </li>
					<?php  	   endforeach;endif;  ?>  			  
        </ul>
      </div>

    </div>
  </div>
</div>

<div class="container">
<div class="row">
  
  <div class="col-lg-9 col-md-6 col-sm-5 mx-auto margin20">@ <?php echo $this->session->userdata('footer_alt'); ?></div>
	<div class="col-lg-3 col-md-6 col-sm-7 mx-auto margin20 h50">
	   <?php       if ($ayar): foreach ($ayar as $dizi): ?>  
					<a title="FACEBOOK" target="_blank" class="syl1 shadow" href="<?php echo $dizi["facebook"]; ?>"><i class="fa fa-facebook" aria-hidden="true"></i></a>
					<a title="INSTAGRAM" target="_blank" class="syl1 shadow" href="<?php echo $dizi["instagram"]; ?>"><i class="fa fa-instagram" aria-hidden="true"></i></a>
					<a title="TWITTER" target="_blank" class="syl1 shadow" href="<?php echo $dizi["twitter"]; ?>"><i class="fa fa-twitter" aria-hidden="true"></i></a>
					<a title="YOUTUBE" target="_blank" class="syl1 shadow" href="<?php echo $dizi["youtube"]; ?>"><i class="fa fa-youtube" aria-hidden="true"></i></a>	
					<?php  	   endforeach;endif;  ?>  


	</div>

</div>
</div>






</footer>


    <script>
  function gonder(){
	  var nm=$("#nm").val();	  
	  var em=$("#em").val();
	  var ph=$("#ph").val();
	  var msg=$("#msg").val();	
	  var ulke=$("#ulke").val();
	

if((nm == "") || (em == "") || (ph == "")) 
{   $( "#sonuc" ).text( "Lütfen boş alan bırakmayın." );   }
else{
	
	veriler="nm="+nm+"&em="+em+"&ph="+ph+"&msg="+msg+"&ulke="+ulke;
	$.ajax({ 
type: "POST", 
url: "<?php echo base_url(); ?>yonetim/mail", 
data: veriler, 
success:function(cevap){ 

$( "#sonuc" ).text( cevap );
} 
})
	
}

	  
  }
  

  
  </script>


          <?php 
  $user_agent = strtolower ( $_SERVER['HTTP_USER_AGENT'] ); 
    if ( preg_match ( "/phone|iphone|itouch|ipod|symbian|android|htc_|htc-|palmos|blackberry|opera mini|iemobile|windows ce|nokia|fennec|hiptop|kindle|mot |mobile|pda;|avantgo|eudoraweb|minimo|netfront|brew|teleca|lg;|lge |wap;| wap |mot-|webos\/|samsung|sonyericsson|^sie-|nintendo/", $user_agent ) ) {  ?>
    <?php }else{ ?>
<!-- Start of HubSpot Embed Code 
  <script type="text/javascript" id="hs-script-loader" async defer src="//js.hs-scripts.com/6754075.js"></script>
End of HubSpot Embed Code -->

<!-- Start of HubSpot Embed Code -->
  <script type="text/javascript" id="hs-script-loader" async defer src="//js.hs-scripts.com/5274217.js"></script>
<!-- End of HubSpot Embed Code -->
<?php } ?>