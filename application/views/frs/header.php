
	
	
	<div class="hl1">
 <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
          <a class="navbar-brand" href="<?php echo base_url(); ?>frs/">
		  
		  LOGO
		  <!--
		  <img alt="" src="<?php echo base_url(); ?>assets_user/tr/img/logo.png" width="150" >
		  -->		  
		  
		  
		  </a>
       
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
             

                          <a class="nav-link" data-toggle="dropdown" href="" role="button">
                 <span class="nav-link-inner--text"><?php echo $this->session->userdata('menu_13'); ?> <i style="font-size:15px; color:#fff; margin-left:4px; margin-top:-5px !important;" class="fa fa-sort-desc" aria-hidden="true"></i></span>
              </a>



	               <div class="dropdown-menu">			   
				   <?php       if ($proje_kat): foreach ($proje_kat as $dizi): ?>  
	                <a title="" href="<?php echo base_url(); ?>frs/<?php echo $dizi["seo_adi"]; ?>" class="dropdown-item"><?php echo $dizi["kategori_adi"]; ?></a>
					<?php  	   endforeach;endif;  ?>    
				  

	              </div>
              </li>
			  
			           <li class="nav-item">
                <a title="" class="nav-link " href="<?php echo base_url(); ?>frs/projects"><?php echo $this->session->userdata('ana_prj'); ?></a>
              </li>
			  
              <li class="nav-item dropdown">
             

                          <a class="nav-link" data-toggle="dropdown" href="#" role="button">
                 <span class="nav-link-inner--text"><?php echo $this->session->userdata('menu_7'); ?> <i style="font-size:15px; color:#fff; margin-left:4px; margin-top:-5px !important;" class="fa fa-sort-desc" aria-hidden="true"></i></span>
              </a>



	               <div class="dropdown-menu">
	                <a title="" href="<?php echo base_url(); ?>frs/rent" class="dropdown-item"><?php echo $this->session->userdata('menu_7'); ?></a>				   
	                <a title="" href="<?php echo base_url(); ?>frs/sale" class="dropdown-item"><?php echo $this->session->userdata('menu_8'); ?></a>				   
				  

	              </div>
              </li>			  
	
                <li class="nav-item">
                <a title="" class="nav-link " href="<?php echo base_url(); ?>frs/daire"><?php echo $this->session->userdata('menu_9'); ?></a>
              </li>
			  
	                <li class="nav-item">
                <a title="" class="nav-link " href="<?php echo base_url(); ?>frs/villa"><?php echo $this->session->userdata('menu_10'); ?></a>
              </li>


			<!--		
		        <li class="nav-item">
				   <?php   $j=0;    if ($proje_kat): foreach ($proje_kat as $dizi):  if($j!=0){continue;} ?>  	
				 	
                <a title="" class="nav-link " href="<?php echo $dizi["seo_adi"]; ?>"><?php echo $this->session->userdata('menu_11'); ?></a>
				
				<?php 	$j=$j+1;   endforeach;endif;  ?>   
              </li>	  
-->
			  

                <li class="nav-item">
                <a title="" class="nav-link " href="<?php echo base_url(); ?>frs/arsa"><?php echo $this->session->userdata('menu_12'); ?></a>
              </li>			  
			  
			  
			  

              <li class="nav-item">
                <a title="" class="nav-link " href="<?php echo base_url(); ?>frs/about"><?php echo $this->session->userdata('menu_2'); ?></a>
              </li>
              



              <li class="nav-item">
                <a title="" class="nav-link " href="<?php echo base_url(); ?>frs/news"><?php echo $this->session->userdata('menu_4'); ?></a>
              </li>


              <li class="nav-item">
                <a title="" class="nav-link" href="<?php echo base_url(); ?>frs/contact"><?php echo $this->session->userdata('menu_5'); ?></a>
              </li>



            <li class="nav-item dropdown">
              <a href="<?php echo base_url(); ?>frs/projects" class="nav-link" data-toggle="dropdown" href="#" role="button">
                 <span class="nav-link-inner--text dil2">RUSSIAN <i style="font-size:15px; color:#000; margin-left:4px; margin-top:-18px !important;" class="fa fa-sort-desc" aria-hidden="true"></i></span>
              </a>
              <div class="dropdown-menu">
                <a title="EN" href="<?php echo base_url(); ?>" class="dropdown-item">English</a>
                <a title="TR" href="<?php echo base_url(); ?>ar" class="dropdown-item">Turkish</a>
                <a title="RU" href="<?php echo base_url(); ?>frs" class="dropdown-item">Russian</a>					
              </div>
            </li>
			
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

             <!-- <li class="nav-item">
              	<div class="row htel1  tright"><?php echo $this->session->userdata('menu_6'); ?></div>
              	<div class="row htel2">
				   <?php       if ($ayar): foreach ($ayar as $dizi): ?>  
	              <?php echo $dizi["tel_1_ar"]; ?>
					<?php  	   endforeach;endif;  ?>    </div>
              </li>-->

            </ul>
          </div>
        </div>
      </nav>
  </div>