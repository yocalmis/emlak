
	
	
	<div class="hl1">
 <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
          <a class="navbar-brand" href="<?php echo base_url(); ?>">
		 
		 <!--   -->
		  <img alt="" style="width:160px; height:80px;" src="<?php echo base_url(); ?>assets_user/tr/img/logo.png" >
		
		  </a>
		  
	  
	<a href="#"  onclick="doGTranslate('tr|tr');jQuery('div.switcher div.selected a').html(jQuery(this).html());return false;"title="Türkçe" class="nturl selected gz2"><img style="margin-right:4px; margin-bottom:4px; " src="<?php echo base_url(); ?>/assets/flags2/tr.png" height="12" width="15" alt="turkish" /></a>
    <a href="#"  onclick="doGTranslate('tr|ru');jQuery('div.switcher div.selected a').html(jQuery(this).html());return false;"title="Russian" class=" nturl gz2"><img style="margin-right:14px;  margin-bottom:4px; " src="<?php echo base_url(); ?>/assets/flags2/ru.png" height="12" width="15" alt="russian" /></a>
<!--
    <a href="#" onclick="doGTranslate('tr|en');jQuery('div.switcher div.selected a').html(jQuery(this).html());return false;"title="English" class=" nturl"><img style="margin-right:4px;  margin-bottom:4px;" src="<?php echo base_url(); ?>/assets/flags2/e.png" height="12" width="15" alt="english" /></a>
-->

			
					
	<a href="<?php echo base_url(); ?>money/index/try" title="Lira" class="nturl selected gz2"><img style=" margin-right:4px; height:12px; margin-bottom:4px;" src="<?php echo base_url(); ?>/assets/flags2/lr.png" height="12" width="15" alt="lira" /></a>

                  <a href="<?php echo base_url(); ?>money/index/euro" title="Euro" class=" nturl gz2"><img  style=" margin-right:4px; height:12px; margin-bottom:4px;" src="<?php echo base_url(); ?>/assets/flags2/eu.png" height="12" width="15" alt="euro" /></a>

             			 <a href="<?php echo base_url(); ?>money/index/ruble" title="Ruble" class=" nturl gz2"><img style=" margin-right:4px; height:12px; margin-bottom:4px;" src="<?php echo base_url(); ?>/assets/flags2/rb.png" height="12" width="15" alt="ruble" /></a>
	      <a href="<?php echo base_url(); ?>money/index/dolar" title="Dollar" class=" nturl gz2"><img style=" margin-right:4px;  margin-bottom:4px; height:12px;" src="<?php echo base_url(); ?>/assets/flags2/$.png" height="12" width="15" alt="dollar" /></a>
			  
		  
		  
		  
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-danger" aria-controls="navbar-danger" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbar-danger">
            <div class="navbar-collapse-header">
              <div class="row">
                <div class="col-6 collapse-brand">
                  <a href="">
                    <img src="<?php echo base_url(); ?>assets_user/tr/img/logosyh.png">
                  </a>
                </div>
                <div class="col-6 collapse-close">
                  <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-danger" aria-controls="navbar-danger" aria-expanded="false" aria-label="Toggle navigation">
                    <span></span>
                    <span></span>
                  </button>
                </div>
              </div>
            </div>

            <ul class="navbar-nav ml-auto">


              <li class="nav-item dropdown">
             

                          <a class="nav-link" data-toggle="dropdown" href="#" role="button">
                 <span class="nav-link-inner--text"><?php echo $this->session->userdata('menu_13'); ?> <i style="font-size:15px; color:#fff; margin-left:4px; margin-top:-5px !important;" class="fa fa-sort-desc" aria-hidden="true"></i></span>
              </a>



	               <div class="dropdown-menu">			   
				   <?php       if ($proje_kat): foreach ($proje_kat as $dizi): ?>  
	                <a title="" href="<?php echo $dizi["seo_adi"]; ?>" class="dropdown-item"><?php echo $dizi["kategori_adi"]; ?></a>
					<?php  	   endforeach;endif;  ?>    
				  

	              </div>
              </li>
			  
			           <li class="nav-item">
                <a title="" class="nav-link " href="projects"><?php echo $this->session->userdata('ana_prj'); ?></a>
              </li>
			  
              <li class="nav-item dropdown">
             

                          <a class="nav-link" data-toggle="dropdown" href="#" role="button">
                 <span class="nav-link-inner--text"><?php echo $this->session->userdata('menu_8'); ?> <!--<i style="font-size:15px; color:#fff; margin-left:4px; margin-top:-5px !important;" class="fa fa-sort-desc" aria-hidden="true"></i>--></span>
              </a>



	            <!--   <div class="dropdown-menu">
	                <a title="" href="rent" class="dropdown-item"><?php echo $this->session->userdata('menu_8'); ?></a>				   
	             <a title="" href="sale" class="dropdown-item"><?php echo $this->session->userdata('menu_7'); ?></a>				   
				 

	              </div>  -->  
              </li>			  
	
                <li class="nav-item">
                <a title="" class="nav-link " href="daire"><?php echo $this->session->userdata('menu_9'); ?></a>
              </li>
			  
	                <li class="nav-item">
                <a title="" class="nav-link " href="villa"><?php echo $this->session->userdata('menu_10'); ?></a>
              </li>


			<!--		
		        <li class="nav-item">
				   <?php   $j=0;    if ($proje_kat): foreach ($proje_kat as $dizi):  if($j!=0){continue;} ?>  	
				 	
                <a title="" class="nav-link " href="<?php echo $dizi["seo_adi"]; ?>"><?php echo $this->session->userdata('menu_11'); ?></a>
				
				<?php 	$j=$j+1;   endforeach;endif;  ?>   
              </li>	  
-->
			  

                <li class="nav-item">
                <a title="" class="nav-link " href="arsa"><?php echo $this->session->userdata('menu_12'); ?></a>
              </li>			  
			  
			  
			  

              <li class="nav-item">
                <a title="" class="nav-link " href="about"><?php echo $this->session->userdata('menu_2'); ?></a>
              </li>
              



              <li class="nav-item">
                <a title="" class="nav-link " href="news"><?php echo $this->session->userdata('menu_4'); ?></a>
              </li>


              <li class="nav-item">
                <a title="" class="nav-link" href="contact"><?php echo $this->session->userdata('menu_5'); ?></a>
              </li>


            <!-- 
            <li class="nav-item dropdown">
              <a href="#" class="nav-link" data-toggle="dropdown" href="#" role="button">
                 <span class="nav-link-inner--text dil2">ENGLISH <i style="font-size:15px; color:#000; margin-left:4px; margin-top:-18px !important;" class="fa fa-sort-desc" aria-hidden="true"></i></span>
              </a>
              <div class="dropdown-menu">
                <a title="EN" href="<?php echo base_url(); ?>" class="dropdown-item">English</a>
                <a title="TR" href="<?php echo base_url(); ?>ar" class="dropdown-item">Turkish</a>
                <a title="RU" href="<?php echo base_url(); ?>frs" class="dropdown-item">Russian</a>					
              </div>
            </li>
		-->	
		<script type="text/javascript">
  jQuery('.switcher .selected').click(function() {if(!(jQuery('.switcher .option').is(':visible'))) {jQuery('.switcher .option').stop(true,true).delay(100).slideDown(500);jQuery('.switcher .selected a').toggleClass('open')}});
  jQuery('.switcher .option').bind('mousewheel', function(e) {var options = jQuery('.switcher .option');if(options.is(':visible'))options.scrollTop(options.scrollTop() - e.originalEvent.wheelDelta);return false;});
  jQuery('body').not('.switcher').mousedown(function(e) {if(jQuery('.switcher .option').is(':visible') && e.target != jQuery('.switcher .option').get(0)) {jQuery('.switcher .option').stop(true,true).delay(100).slideUp(500);jQuery('.switcher .selected a').toggleClass('open')}});
</script>

<li style="display:none" id="google_translate_element2"></li>
<script type="text/javascript">
  function googleTranslateElementInit2() {new google.translate.TranslateElement({pageLanguage: 'tr',autoDisplay: false}, 'google_translate_element2');}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit2"></script>


<script type="text/javascript">
  function GTranslateGetCurrentLang() {var keyValue = document.cookie.match('(^|;) ?googtrans=([^;]*)(;|$)');return keyValue ? keyValue[2].split('/')[2] : null;}
  function GTranslateFireEvent(element,event){try{if(document.createEventObject){var evt=document.createEventObject();element.fireEvent('on'+event,evt)}else{var evt=document.createEvent('HTMLEvents');evt.initEvent(event,true,true);element.dispatchEvent(evt)}}catch(e){}}
  function doGTranslate(lang_pair){if(lang_pair.value)lang_pair=lang_pair.value;if(lang_pair=='')return;var lang=lang_pair.split('|')[1];if(GTranslateGetCurrentLang() == null && lang == lang_pair.split('|')[0])return;var teCombo;var sel=document.getElementsByTagName('select');for(var i=0;i<sel.length;i++)if(sel[i].className=='goog-te-combo')teCombo=sel[i];if(document.getElementById('google_translate_element2')==null||document.getElementById('google_translate_element2').innerHTML.length==0||teCombo.length==0||teCombo.innerHTML.length==0){setTimeout(function(){doGTranslate(lang_pair)},500)}else{teCombo.value=lang;GTranslateFireEvent(teCombo,'change');GTranslateFireEvent(teCombo,'change')}}
  if(GTranslateGetCurrentLang() != null)jQuery(document).ready(function() {jQuery('div.switcher div.selected a').html(jQuery('div.switcher div.option').find('img[alt="'+GTranslateGetCurrentLang()+'"]').parent().html());});
</script>		
			
<style>
      /* Translate */
      #goog-gt-tt {display:none !important;}
      .goog-te-banner-frame {display:none !important;}
      .goog-te-menu-value:hover {text-decoration:none !important;}
      body {top:0 !important;}
      #google_translate_element2 {display:none!important;}
	  
	  
@media only screen and (max-width: 1500px) {

.gz {
visibility: visible;

}


.gz2 {
visibility: hidden;

}



}	


	
@media only screen and (max-width: 950px) {

.gz {
visibility: hidden;

}


.gz2 {
visibility: visible;
margin-right:1px;

}



}



	  
	  
	  
	  
	  
</style>			
			
			
	<a href="#" onclick="doGTranslate('tr|tr');jQuery('div.switcher div.selected a').html(jQuery(this).html());return false;"title="Türkçe" class="nturl selected gz"><img style="margin-right:4px; margin-bottom:4px;" src="<?php echo base_url(); ?>/assets/flags2/tr.png" height="12" width="15" alt="turkish" /></a>
    <a href="#" onclick="doGTranslate('tr|ru');jQuery('div.switcher div.selected a').html(jQuery(this).html());return false;"title="Russian" class=" nturl gz"><img style="margin-right:14px;  margin-bottom:4px;" src="<?php echo base_url(); ?>/assets/flags2/ru.png" height="12" width="15" alt="russian" /></a>
<!--
    <a href="#" onclick="doGTranslate('tr|en');jQuery('div.switcher div.selected a').html(jQuery(this).html());return false;"title="English" class=" nturl"><img style="margin-right:4px;  margin-bottom:4px;" src="<?php echo base_url(); ?>/assets/flags2/e.png" height="12" width="15" alt="english" /></a>
-->
  
			
					
	<a href="<?php echo base_url(); ?>money/index/try" title="Lira" class="nturl selected gz"><img style="margin-right:4px; height:12px; margin-bottom:4px;" src="<?php echo base_url(); ?>/assets/flags2/lr.png" height="12" width="15" alt="lira" /></a>

                  <a href="<?php echo base_url(); ?>money/index/euro" title="Euro" class=" nturl gz"><img style="margin-right:4px; height:12px; margin-bottom:4px;" src="<?php echo base_url(); ?>/assets/flags2/eu.png" height="12" width="15" alt="euro" /></a>

             			 <a href="<?php echo base_url(); ?>money/index/ruble" title="Ruble" class=" nturl gz"><img style="margin-right:4px; height:12px; margin-bottom:4px;" src="<?php echo base_url(); ?>/assets/flags2/rb.png" height="12" width="15" alt="ruble" /></a>
	      <a href="<?php echo base_url(); ?>money/index/dolar" title="Dollar" class=" nturl gz"><img style="margin-right:4px;  margin-bottom:4px; height:12px;" src="<?php echo base_url(); ?>/assets/flags2/$.png" height="12" width="15" alt="dollar" /></a>
			 

   <link href="<?php echo base_url();?>assets/fontawesome/css/fontawesome.css" rel="stylesheet">
  <link href="<?php echo base_url();?>assets/fontawesome/css/brands.css" rel="stylesheet">
  <link href="<?php echo base_url();?>assets/fontawesome/css/solid.css" rel="stylesheet">
	<!--		 
         <li class="nav-item dropdown">
              <a href="#" class="nav-link" data-toggle="dropdown" href="#" role="button">
                 <span class="nav-link-inner--text dil2">PARA BİRİMİ <i style="font-size:15px; color:#000; margin-left:4px; margin-top:-18px !important;" class="fa fa-sort-desc" aria-hidden="true"></i></span>
              </a>
              <div class="dropdown-menu">
			      <a title="EN" href="<?php echo base_url(); ?>money/index/try" class="dropdown-item">Lira</a>
                <a title="EN" href="<?php echo base_url(); ?>money/index/euro" class="dropdown-item">Euro</a>
                <a title="TR" href="<?php echo base_url(); ?>money/index/dolar" class="dropdown-item">Dollar</a>
                <a title="RU" href="<?php echo base_url(); ?>money/index/ruble" class="dropdown-item">Ruble</a>					
           
		   </div>
            </li>
			
-->

            </ul>
          </div>
        </div>
      </nav>
  </div>