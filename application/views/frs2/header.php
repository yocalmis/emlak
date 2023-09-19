<div class="hl1">
<nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
          <div class="collapse navbar-collapse" id="navbar-danger">
            <div class="navbar-collapse-header">
              <div class="row">
                <div class="col-6 collapse-brand">
                  <a href="<?php echo base_url(); ?>">
                    <img src="<?php echo base_url(); ?>assets_user/frs/img/logosyh.png">
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

            <ul class="navbar-nav mr-auto">

   <!-- <li class="nav-item">
                <div class="row"><div class="htel1 tright"><?php echo $this->session->userdata('menu_6'); ?></div></div>
                <div class="row htel2">
							   <?php       if ($ayar): foreach ($ayar as $dizi): ?>  
	              <?php echo $dizi["tel_1_frs"]; ?>
					<?php  	   endforeach;endif;  ?> 	
				</div>
              </li>-->

            <li class="nav-item dropdown">
              <a href="<?php echo base_url(); ?>frs/projects" class="nav-link" data-toggle="dropdown" href="#" role="button">
                 <span class="nav-link-inner--text dil2 tright">فارسی <i style="font-size:15px; color:#000; margin-left:4px; margin-top:-18px !important;" class="fa fa-sort-desc" aria-hidden="true"></i></span>
              </a>
              <div class="dropdown-menu">
                <a href="<?php  echo $alter; ?>" title="en" class="dropdown-item">انگلیسی 
</a>
                <a href="<?php echo base_url(); ?>frs"  title="frs" class="dropdown-item">فارسی</a>
				<a title="ar" href="<?php  echo $link_3; ?>" class="dropdown-item">عربی</a>	
				
				
              </div>
            </li>

       <li class="nav-item">
                <a class="nav-link"  title="" href="<?php echo base_url(); ?>frs/contact"><?php echo $this->session->userdata('menu_5'); ?></a>
              </li>



              <li class="nav-item">
                <a class="nav-link "  title="" href="<?php echo base_url(); ?>frs/news"><?php echo $this->session->userdata('menu_4'); ?></a>
              </li>


              <li class="nav-item">
                <a class="nav-link "  title="" href="<?php echo base_url(); ?>frs/buyer_guide"><?php echo $this->session->userdata('menu_3'); ?></a>
              </li>




              <li class="nav-item">
                <a class="nav-link "  title="" href="<?php echo base_url(); ?>frs/about"><?php echo $this->session->userdata('menu_2'); ?></a>
              </li>

              <li class="nav-item dropdown">
             
              <a href="#" class="nav-link" data-toggle="dropdown" href="#" role="button">
                 <span class="nav-link-inner--text"><i style="font-size:15px; color:#fff; margin-left:4px; margin-top:-5px !important;" class="fa fa-sort-desc" aria-hidden="true"></i><?php echo $this->session->userdata('menu_1'); ?> </span>
              </a>

                 <div class="dropdown-menu">
	                <a href="<?php echo base_url(); ?>frs/projects"  title="" class="dropdown-item" style="text-align:right;"><?php echo $this->session->userdata('ana_prj_kck'); ?></a>
				   <?php       if ($proje_kat): foreach ($proje_kat as $dizi): ?>  
	                <a href="<?php echo base_url(); ?>frs/<?php echo $dizi["seo_adi"]; ?>"  title="" class="dropdown-item" style="text-align:right;"><?php echo $dizi["kategori_adi_frs"]; ?></a>
					<?php  	   endforeach;endif;  ?>    
                </div>
              </li>

            </ul>
          </div>

                    <a class="navbar-brand mr-auto" href="<?php echo base_url(); ?>frs"><img alt="" src="<?php echo base_url(); ?>assets_user/frs/img/logo.png" width="150" ></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-danger" aria-controls="navbar-danger" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>


        </div>
      </nav>
  </div>