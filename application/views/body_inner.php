<!--	
<div>
		<a href='<?php echo site_url('examples/customers_management')?>'>Customers</a> |
		<a href='<?php echo site_url('examples/orders_management')?>'>Orders</a> |
		<a href='<?php echo site_url('examples/products_management')?>'>Products</a> |
		<a href='<?php echo site_url('examples/offices_management')?>'>Offices</a> | 
		<a href='<?php echo site_url('examples/employees_management')?>'>Employees</a> |		 
		<a href='<?php echo site_url('examples/film_management')?>'>Films</a> |
		<a href='<?php echo site_url('examples/multigrids')?>'>Multigrid [BETA]</a>
		
</div>
-->
<script>
	window.self = {
		base_url: '<?php echo base_url(); ?>',
	}
	var self = window.self;
</script>

<div class="side-nav">
	<div class="s-n_h">
		<div class="s-n_h_t">
			<h3>Emlak Yönetim Paneli</h3>
		</div>
	</div>
	<ul class="side-nav--list scrollbar" data-simplebar>

		<li>		
			<h2>
		
<!--		
			<center>
					<?php if($this->session->userdata('ln')=="ar"){ ?>	
		<img src="<?php echo site_url('assets/flags/')?>turkey.svg" style="width:40px; height:40px; padding-right:7px;">
</a>		
		<?php } if($this->session->userdata('ln')=="en"){  ?>			
		<img src="<?php echo site_url('assets/flags/')?>england.svg" style="width:40px; height:40px;  padding-right:7px;">
</a>		
		
		<?php } if($this->session->userdata('ln')=="frs"){  ?>			
		<img src="<?php echo site_url('assets/flags/')?>russia.svg" style="width:40px; height:40px;  padding-right:7px;">
</a>		
		
		<?php } ?>	
			</center>
	-->		
			
				<center>Emlak</center>
	
			</h2>
		</li>
		<li>
			<a class="sidenav__link">
				<span class="icon icon--mr05" data-svg="outline-access_time-24px"></span>
				<?php $this->load->view('saat'); ?>
			</a>
		</li>

		<li>
			<a class="sidenav__link" href='<?php echo site_url('yonetim')?>'>
				<span class="icon icon--mr05" data-svg="outline-home-24px"></span>
				Anasayfa
			</a>
		</li>

		<li class="mine-trigger">
			<a class="sidenav__link">
				<span class="icon icon--mr05" data-svg="outline-settings-24px"></span>
				Ayarlar
			</a>
			<div class="mine-content">
					<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/ayar/edit/1')?>'>
						<span class="icon icon--mr05" data-svg="settings_applications-24px"></span>
						Sistem Ayarları
					</a>
		
					<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/dil_sabitleri')?>'>
						<span class="icon icon--mr05" data-svg="settings_applications-24px"></span>
						Sabit Dil Tanımlamaları
					</a>
						<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/robot')?>'>
						<span class="icon icon--mr05" data-svg="settings_applications-24px"></span>
						Robot Dosyası
					</a>
					
										<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/generator')?>'>
						<span class="icon icon--mr05" data-svg="settings_applications-24px"></span>
						Sitemap Generator
					</a>
					
		</div>
	</li>

		<li class="mine-trigger">
			<a class="sidenav__link">
				<span class="icon icon--mr05" data-svg="account_balance_wallet-24px"></span>
				Kategoriler
			</a>
			<div class="mine-content">
					<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/kategori')?>'>
						<span class="icon icon--mr05" data-svg="business-24px"></span>
				  Kategoriler
					</a>
		
		<!--		<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/alt_kategori')?>'>
					<span class="icon icon--mr05" data-svg="business-24px"></span>
					Proje Alt Kategori
				</a>
				-->
				<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/haber_kategori')?>'>
					<span class="icon icon--mr05" data-svg="business-24px"></span>
					Makale-Haber Kategori
				</a>				
					
		</div>
	</li>

	<li class="mine-trigger">
			<a class="sidenav__link">
				<span class="icon icon--mr05" data-svg="library_books-24px"></span>
				Proje Tanımlamaları
			</a>
			<div class="mine-content">
					<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/proje_tip')?>'>
						<span class="icon icon--mr05" data-svg="business-24px"></span>
					Proje Tipleri
					</a>
		
				<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/unite_tip')?>'>
					<span class="icon icon--mr05" data-svg="business-24px"></span>
					Ünite Tipleri
				</a>
				
				<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/proje_ozellik')?>'>
					<span class="icon icon--mr05" data-svg="business-24px"></span>
					Proje Özellikleri
				</a>				
					
		</div>
	</li>



		<li class="mine-trigger">
			<a class="sidenav__link">
			<span class="icon icon--mr05" data-svg="receipt-24px"></span>
				İçerik
			</a>
			<div class="mine-content">
					<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/proje')?>'>
						<span class="icon icon--mr05" data-svg="business-24px"></span>
					Projeler
					</a>
					<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/daire')?>'>
						<span class="icon icon--mr05" data-svg="business-24px"></span>
					Daireler
					</a>
					<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/villas')?>'>
						<span class="icon icon--mr05" data-svg="business-24px"></span>
					Villa
					</a>					
					<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/arsa')?>'>
						<span class="icon icon--mr05" data-svg="business-24px"></span>
					Arsa
					</a>						
					
					
						<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/proje_fiyat')?>'>
						<span class="icon icon--mr05" data-svg="business-24px"></span>
					Proje-Daire Fiyatları
					</a>	
				<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/haber')?>'>
					<span class="icon icon--mr05" data-svg="business-24px"></span>
					Haberler
				</a>
				
			<!--		<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/buyer')?>'>
					<span class="icon icon--mr05" data-svg="business-24px"></span>
					Makaleler
				</a>	-->
				
					<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/foto_genel')?>'>
					<span class="icon icon--mr05" data-svg="business-24px"></span>
					Genel Resimler
				</a>

					<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/hakkimizda')?>'>
					<span class="icon icon--mr05" data-svg="business-24px"></span>
					Hakkımızda
				</a>	

				<!--	<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/yorum')?>'>
					<span class="icon icon--mr05" data-svg="business-24px"></span>
					Yorumlar
				</a>-->
					<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/mesaj')?>'>
					<span class="icon icon--mr05" data-svg="business-24px"></span>
					Mesajlar
				</a>				
					<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/servis')?>'>
					<span class="icon icon--mr05" data-svg="business-24px"></span>
					Servis
				</a>
			</a>
					<a class="sidenav__link mine-content__link" href='<?php echo site_url('yonetim/link')?>'>
					<span class="icon icon--mr05" data-svg="business-24px"></span>
					Faydalı Linkler
				</a>				
				
				
			</a>	

				
			
		</div>
	</li>
	
	
	<!--
	
	<li class="mine-trigge">
		
		<?php if($this->session->userdata('ln')=="en"){ ?>	
		<a href="<?php echo site_url('yonetim/lng/ar')?>" class="user-info__link waves-effect">
		<img src="<?php echo site_url('assets/flags/')?>turkey.svg" style="width:20px; height:20px; padding-right:7px;"> Türkçe'ye Geç
</a>	

		<a href="<?php echo site_url('yonetim/lng/frs')?>" class="user-info__link waves-effect">
		<img src="<?php echo site_url('assets/flags/')?>russia.svg" style="width:20px; height:20px; padding-right:7px;"> Rusçaya Geç
</a>	

		<?php }
		if($this->session->userdata('ln')=="ar"){ ?>			
		<a href="<?php echo site_url('yonetim/lng/en')?>" class="user-info__link waves-effect">
		<img src="<?php echo site_url('assets/flags/')?>england.svg" style="width:20px; height:20px;  padding-right:7px;"> 	İngilizceye Geç
</a>	

	<a href="<?php echo site_url('yonetim/lng/frs')?>" class="user-info__link waves-effect">
		<img src="<?php echo site_url('assets/flags/')?>russia.svg" style="width:20px; height:20px; padding-right:7px;"> Rusçaya Geç
</a>	
		
		<?php } if($this->session->userdata('ln')=="frs"){ ?>			
		<a href="<?php echo site_url('yonetim/lng/en')?>" class="user-info__link waves-effect">
		<img src="<?php echo site_url('assets/flags/')?>england.svg" style="width:20px; height:20px;  padding-right:7px;"> 	İngilizceye Geç
</a>	
		<a href="<?php echo site_url('yonetim/lng/ar')?>" class="user-info__link waves-effect">
		<img src="<?php echo site_url('assets/flags/')?>turkey.svg" style="width:20px; height:20px; padding-right:7px;"> Türkçeye Geç
</a>
	
		<?php } ?>					

	</li>
	
	-->
	
	
	
	
	

	</ul>
	<p class="s-n_f">© 2022 Tüm Haklar Saklıdır</p>	
</div>
<div class="side-header">	
<!--	<input type="button" value="DRİVE" onclick="window.location.href = '';"/>
	<input type="button" style="margin-left:1px;" value="MESAJ" onclick="window.location.href = '';"/>
	<input type="button" value="ETKİNLİK" onclick="window.location.href = '';"/>
-->
<a class="o_s-n waves-effect"><span class="icon" data-svg="outline-menu-24px"></span></a>
<h3></h3>
<div class="s-h_r">

	<div class="user-menu">

		<a class="user-menu__trigger waves-effect">
			<?php echo $online=$this->session->userdata('adminonline'); ?>
		</a>
		<div class="user-menu__inner">
			<div class="user-info user-menu__info">
				<span class="icon icon--mr05 user-info__user" data-svg="person-24px"></span>
				<div class="user-info__text">
					<h3 class="user-info__title">
						<?php echo $online=$this->session->userdata('adminonline'); ?>
						
					</h3>
					<p class="user-info__yetki">
						<?php 
						if($this->session->userdata('uye_turu')==0){ echo"Süper Admin"; }
						if($this->session->userdata('uye_turu')==1){ echo"Yetkili"; }
						if($this->session->userdata('uye_turu')==2){  echo"Düşük Yetkili"; 	

						}
						?>
					</p>
				</div>

			</div>
			<p class="divider"></p> 

				<ul class="user-info__apps mbd5">
					<li class="user-info__app">
						<a href="<?php echo site_url('yonetim/bilgi/edit/'.$this->session->userdata('id'))?>" class="user-info__link waves-effect">
							<span class="icon icon--mr05" data-svg="lock_open-24px"></span>
							Şifre değiştir
						</a>
					</li>
					<li class="user-info__app">
						<a href="<?php echo site_url('yonetim/cikis')?>" class="user-info__link waves-effect">
							<span class="icon icon--mr05" data-svg="exit_to_app-24px"></span>
							Çıkış
						</a>
					</li>
					
			<!--			<li class="user-info__app">
						<a href="<?php echo site_url('yonetim/lng/en')?>" class="user-info__link waves-effect">
						<img src="<?php echo site_url('assets/flags/')?>england.svg" style="width:20px; height:20px;"> 
					İngilizce
						</a>
					</li>				
					
						<li class="user-info__app">
						<a href="<?php echo site_url('yonetim/lng/ar')?>" class="user-info__link waves-effect">
						<img src="<?php echo site_url('assets/flags/')?>saudi-arabia.svg" style="width:20px; height:20px;"> 
					Arapça
						</a>
					</li>					
				-->	
					
					
					
					
				</ul>
			</div>
			
		</div>
		
		
		
	</div>		
</div>
<div class="iframeModal">
	<div class="iframeModal__header">
		<div>
			<h3 class="iframeModal__heading"></h3>
		</div>
		<a class="iframeModal__close">
			<span class="icon" data-svg="close-24px"></span>
		</a>
	</div>
	<div class="iframeModal__content">
		<iframe id="calculator" class="iframeModal__iframe" src="" frameborder="0"></iframe>
	</div>
</div>
<div class="iframeModal__backdrop"></div>
<main>
	<div class="pageInner" data-simplebar style="background-image: url(<?php echo base_url(); ?>/assets/city.jpg); background-color: #80cbc4;">