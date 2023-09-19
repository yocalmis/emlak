<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Frs extends CI_Controller
{

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     *         http://example.com/index.php/welcome
     *    - or -
     *         http://example.com/index.php/welcome/index
     *    - or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see https://codeigniter.com/user_guide/general/urls.html
     */

    public function __construct()
    {
        parent::__construct();

        $this->load->database();
        $this->load->helper('url');

        $this->load->library('grocery_CRUD');
		
        if ($this->session->userdata('para_birim') == '') {
	$this->session->set_userdata('para_icon',"try");       
	$this->session->set_userdata('para_birim',"1");   
		}		  
		

        if ($this->session->userdata('lng') != 'frs') {
        //    $this->dil();

/*			if(!empty($_SERVER['HTTP_REFERER'])){ 		
	$url = htmlspecialchars($_SERVER['HTTP_REFERER']);	
		if($url!=""){
	
	$par=explode(base_url(),$url);
    if(strstr($par[1], "ar")) { 	}
	else{
    $son=base_url()."ar/".$par[1];	
    $this->load->library('messages');
    $this->messages->direk_yon($son);	
	}
	 }
	 }*/	 
	 
		
        }

    }

    public function dil()
    {
        $this->load->model('user_model');
        $data["ln"] = $this->user_model->dil_getir();
        if ($data["ln"]): foreach ($data["ln"] as $dizi):
                $this->session->set_userdata('lng', "frs");
                $this->session->set_userdata($dizi["adi"], $dizi["frs"]);
            endforeach;endif;

		echo $this->kur();

    }

    public function kur()
    {

        $this->load->model('user_model');
        $data["ayar"] = $this->user_model->ayar();
		
        if ($data["ayar"]): foreach ($data["ayar"] as $dizi):
                $this->session->set_userdata('try', 1);			
                $this->session->set_userdata('euro', $dizi["try_euro"]);
                $this->session->set_userdata('dolar', $dizi["try_dolar"]);				
                $this->session->set_userdata('ruble', $dizi["try_ruble"]);				
				
				
            endforeach;endif;

    }

    public function index($prop = "",$p = "")
    {

        if (($prop == "") or ($prop == "index")) {
            $this->anasayfa();
            return false;
        }

        $where = $this->where_page($prop);

        $this->to_page($where, $prop, $p);
    }

    public function where_page($prop)
    {

        $this->load->model('user_model');
        return $this->user_model->bul2($prop);

    }

    public function to_page($where, $prop, $p)
    {

        switch ($where) {
            default:
                $this->output->set_status_header('404');
                $this->load->view('error404');
                break;
            case "kategori":
                $this->kategori($prop, $p);
                break;
            case "haber_kategori":
                $this->haber_kategori($prop, $p);
                break;
            case "buyer_kategori":
                $this->haber_kategori($prop, $p);
                break;
            case "proje":
                $this->proje($prop);
                break;
            case "haber":
                $this->haber($prop);
                break;
            case "buyer":
                $this->buyer($prop);
                break;
			            case "page":
                $this->page($prop);
                break;
            case "rs":
                $this->rent_sale($prop);
                break;
        }

    }

    public function cache_head($cachedosyasi)
    {
        $cachetime = 1; // 10 saniyede bi cache yap
        if (file_exists($cachedosyasi) && (time() - $cachetime < filemtime($cachedosyasi))) {
            include $cachedosyasi;
            exit;
        }
        ob_start();
    }
    public function cache_foot($cachedosyasi)
    {
        $ch = fopen($cachedosyasi, 'w');
        fwrite($ch, ob_get_contents());
        fclose($ch);
        ob_end_flush();
    }

    public function anasayfa()
    {
        
          $this->dil();
        
        
        $this->cache_head("cache/anasayfa_frs.php");
        $this->load->model('user_model');
        $data["ayar"]         = $this->user_model->ayar();
        $data["servis"]       = $this->user_model->servis();
        $data["yorum"]        = $this->user_model->yorum();
        $data["proje_kat"]    = $this->user_model->proje_kat(7);
        $data["haber_kat"]    = $this->user_model->haber_kat(5);
        $data["linkler"]      = $this->user_model->linkler();
        $data["fav_proje"]    = $this->user_model->proje_getir2("favori");
        $data["yeni_proje"]   = $this->user_model->proje_getir2("yeni");
        $data["manset_proje"] = $this->user_model->proje_kat(4);
        $data["haber_getir"]  = $this->user_model->haber_getir("manset");
        
        $data["kat_haber_manset"]     = $this->user_model->kat_haber_manset();
        $data["kat_haber_manset_3"]     = $this->user_model->kat_haber_manset_3();		
        $data["kat_haber_manset_buyuk"]     = $this->user_model->kat_haber_manset_buyuk();	         

        $data["proje_ozellik_getir_tum"] = $this->user_model->proje_ozellik_getir_tum();
        $data["proje_tip_getir_tum"]     = $this->user_model->proje_tip_getir_tum();
        $data["proje_kat_tum"]           = $this->user_model->proje_kat(100);
        $data["proje_yeri"]              = $this->user_model->unite_tip_getir_tum();
        $n                               = 0;if ($data["proje_kat_tum"]): foreach ($data["proje_kat_tum"] as $dizi):
                $data["alt_kat"][$n]           = $this->user_model->alt_kat($dizi["kategori_id"]);
                $n                             = $n + 1;endforeach;endif;
        $data["canonical"]               = base_url()."frs";
        $data["alter"]       = base_url()."ar";		
		$data["link_3"]     = base_url()."frs";
        $this->load->view('frs/index', $data);

        $this->cache_foot("cache/anasayfa_frs.php");
    }

    public function contact()
    {$this->dil();
        $this->cache_head("cache/contact_frs.php");
        $this->load->model('user_model');
        $data["ayar"]      = $this->user_model->ayar();
        $data["proje_kat"] = $this->user_model->proje_kat(7);
        $data["haber_kat"] = $this->user_model->haber_kat(5);
        $data["linkler"]   = $this->user_model->linkler();
        $data["canonical"] = base_url()."frs/contact";
        $data["alter"]       = base_url()."contact";
		$data["link_3"]     = base_url()."ar/contact";
        $this->load->view('frs/iletisim', $data);
        $this->cache_foot("cache/contact_frs.php");
    }

    public function about()
    {$this->dil();
        $this->cache_head("cache/about_frs.php");
        $this->load->model('user_model');
        $data["ayar"]       = $this->user_model->ayar();
        $data["proje_kat"]  = $this->user_model->proje_kat(7);
        $data["haber_kat"]  = $this->user_model->haber_kat(5);
        $data["linkler"]    = $this->user_model->linkler();
        $data["hakkimizda"] = $this->user_model->hakkimizda();
        $data["canonical"]  = base_url()."frs/about";
        $data["alter"]       = base_url()."about";
		$data["link_3"]     = base_url()."ar/about";
        $this->load->view('frs/hakkimizda', $data);
        $this->cache_foot("cache/about_frs.php");
    }
	
	
	
	
  public function search()
    {$this->dil();

        $data["kat"] = "";
        $data["tip"] = "";
        $data["yer"] = "";
        $data["oz"]  = "";
        $kat         = $this->input->post('kat', true);
        $kat         = trim($kat);
        $kat         = strip_tags($kat);
        $kat         = htmlentities($kat);
        $tip         = $this->input->post('tip', true);
        $tip         = trim($tip);
        $tip         = strip_tags($tip);
        $tip         = htmlentities($tip);
        $yer         = $this->input->post('yer', true);
        $yer         = trim($yer);
        $yer         = strip_tags($yer);
        $yer         = htmlentities($yer);
        $oz         = $this->input->post('oz', true);
        $oz         = trim($oz);
        $oz         = strip_tags($oz);
        $oz         = htmlentities($oz);		
		

         $data["kat"] = $kat;
         $data["tip"] = $tip;
        $data["yer"] = $yer;
        $data["oz"]  = $oz;

		

        $this->load->model('user_model');
        $data["yer_adi"]="";
        if ($data["kat"] != "") {$data["kat_adi"] = $this->user_model->proje_kat_adi_id_frs($kat);}
        if ($data["tip"] != "") {$data["tip_adi"] = $this->user_model->proje_tip_ad_getir_frs($tip);}
        if ($data["yer"] != "") {$data["yer_adi"] = $this->user_model->unite_ad_getir($yer);}
        if ($data["oz"] != "") {$data["oz_adi"] = $oz." $"; }		
		
		
        $data["ayar"]      = $this->user_model->ayar();
        $data["proje_kat"] = $this->user_model->proje_kat(7);
        $data["haber_kat"] = $this->user_model->haber_kat(5);
        $data["linkler"]   = $this->user_model->linkler();

        $data["arama"]     = $this->user_model->arama($kat, $tip, $yer ,$data["yer_adi"], $oz);
		 $adet = count($data["arama"]);
        if ($adet == 1) {if ($data["arama"][0] == "") {$data["arama"] = "";}}
		
        if ($data["yer"] != "") {$data["yer_adi"] = $this->user_model->unite_ad_getir_frs($yer);}
		
		
		
		$data["proje_ozellik_getir_tum"] = $this->user_model->proje_ozellik_getir_tum();
        $data["proje_tip_getir_tum"]     = $this->user_model->proje_tip_getir_tum();
        $data["proje_kat_tum"]           = $this->user_model->proje_kat(100);
        $data["proje_yeri"]              = $this->user_model->unite_tip_getir_tum();
        $data["canonical"]               = base_url()."frs/search";
        $data["alter"]       = base_url()."search";
		$data["link_3"]     = base_url()."ar/search";
        $n                               = 0;if ($data["proje_kat_tum"]): foreach ($data["proje_kat_tum"] as $dizi):
                $data["alt_kat"][$n]           = $this->user_model->alt_kat($dizi["kategori_id"]);
                $n                             = $n + 1;endforeach;endif;

        $this->load->view('frs/arama', $data);

    }	
	
	
	
	
	
	
	
	

    public function search2()
    {$this->dil();

        $data["kat"] = "";
        $data["tip"] = "";
        $data["yer"] = "";
        $data["oz"]  = "";
        $kat         = $this->input->post('kat', true);
        $kat         = trim($kat);
        $kat         = strip_tags($kat);
        $kat         = htmlentities($kat);
        $tip         = $this->input->post('tip', true);
        $tip         = trim($tip);
        $tip         = strip_tags($tip);
        $tip         = htmlentities($tip);
        $yer         = $this->input->post('yer', true);
        $say         = count($yer);
        $dongu       = $say - 1;
        for ($i = 0; $i <= $dongu; $i++) {

            $yer[$i] = trim($yer[$i]);
            $yer[$i] = strip_tags($yer[$i]);
            $yer[$i] = htmlentities($yer[$i]);
        }
        $oz    = $this->input->post('oz', true);
        $say   = count($oz);
        $dongu = $say - 1;
        for ($i = 0; $i <= $dongu; $i++) {

            $oz[$i] = trim($oz[$i]);
            $oz[$i] = strip_tags($oz[$i]);
            $oz[$i] = htmlentities($oz[$i]);
        }

        $data["kat"] = $kat;
        $data["tip"] = $tip;
        $data["yer"] = $yer;
        $data["oz"]  = $oz;
        if ($data["tip"] != "") {
            $this->load->model('admin_model');
            $tip_kontrol = $this->admin_model->tip_kontrol($tip);

            if ($tip_kontrol == 1) {
                $yer = "";
            }
        }

        $this->load->model('user_model');
        if ($data["kat"] != "") {$data["kat_adi"] = $this->user_model->proje_kat_adi_id_frs($kat);}
        if ($data["tip"] != "") {$data["tip_adi"] = $this->user_model->proje_tip_ad_getir_frs($tip);}

        $adet = count($data["oz"]);
        if ($adet == 1) {
            if ($data["oz"][0] == "") {$data["oz"] = "";
                $oz                                    = "";}}

        if ($data["oz"] != "") {
            $say   = count($oz);
            $dongu = $say - 1;
            for ($i = 0; $i <= $dongu; $i++) {
                $data["oz_adi"][$i] = $this->user_model->proje_oz_ad_getir_frs($oz[$i]);
            }

        }

        $adet = count($data["yer"]);
        if ($adet == 1) {
            if ($data["yer"][0] == "") {$data["yer"] = "";
                $yer                                    = "";}}
        if ($data["yer"] != "") {
            $say   = count($yer);
            $dongu = $say - 1;
            for ($i = 0; $i <= $dongu; $i++) {
                $data["unite_adi"][$i] = $this->user_model->unite_ad_getir_frs($yer[$i]);
            }

        }

        $data["ayar"]      = $this->user_model->ayar();
        $data["proje_kat"] = $this->user_model->proje_kat(7);
        $data["haber_kat"] = $this->user_model->haber_kat(5);
        $data["linkler"]   = $this->user_model->linkler();
        $data["arama"]     = $this->user_model->arama($kat, $tip, $yer, $oz);

        $adet = count($data["arama"]);
        if ($adet == 1) {if ($data["arama"][0] == "") {$data["arama"] = "";}}

        $data["proje_ozellik_getir_tum"] = $this->user_model->proje_ozellik_getir_tum();
        $data["proje_tip_getir_tum"]     = $this->user_model->proje_tip_getir_tum();
        $data["proje_kat_tum"]           = $this->user_model->proje_kat(100);
        $data["proje_yeri"]              = $this->user_model->unite_tip_getir_tum();
        $data["canonical"]               = base_url()."frs/search";
        $data["alter"]       = base_url()."search";
        $n                               = 0;if ($data["proje_kat_tum"]): foreach ($data["proje_kat_tum"] as $dizi):
                $data["alt_kat"][$n]           = $this->user_model->alt_kat($dizi["kategori_id"]);
                $n                             = $n + 1;endforeach;endif;

        $this->load->view('frs/arama', $data);

    }

    public function kategori($prop = null,$p = null)
    {$this->dil();
        $this->cache_head("cache/kategori_" . $prop . "_frs.php");
        //prop'a göre kat_id getir
        $this->load->model('user_model');
        $data["ayar"]          = $this->user_model->ayar();
        $data["proje_kat"]     = $this->user_model->proje_kat(7);
        $data["haber_kat"]     = $this->user_model->haber_kat(5);
        $data["linkler"]       = $this->user_model->linkler();
        $data["proje_kat_tum"] = $this->user_model->proje_kat(100);
        $kat_id                = $this->user_model->kat_id_getir($prop);
        //  $data["alt_kat"]   = $this->user_model->alt_kat($kat_id);
        $n                     = 0;if ($data["proje_kat_tum"]): foreach ($data["proje_kat_tum"] as $dizi):
                $data["alt_kat"][$n] = $this->user_model->alt_kat($dizi["kategori_id"]);
                $n                   = $n + 1;endforeach;endif;
        $data["kat_bilgi"]     = $this->user_model->kat_bilgi($prop);
        $data["kat_proje"]     = $this->user_model->kat_proje($kat_id,$p);
		
        $data["say"]       = count($this->user_model->kat_proje_tum($kat_id));
        $data["page"]      = ceil($data["say"] / 21);
        $data["p"]         = $p;		
        $data["prop"]         = $prop;			
		
        $data["canonical"]     = base_url()."frs/" . $prop;
        $data["alter"]       = base_url()."". $prop;
		$data["link_3"]     = base_url()."ar/" . $prop;
        $this->load->view('frs/kategori', $data);
        $this->cache_foot("cache/kategori_" . $prop . "_frs.php");
    }
	
			  public function page($prop = null,$p = null)
    {
		
 $this->dil();
        //prop'a göre kat_id getir

        $this->cache_head("cache/kategori_" . $prop . "_en.php");
        $this->load->model('user_model');
        $data["ayar"]          = $this->user_model->ayar();
        $data["proje_kat"]     = $this->user_model->proje_kat(7);
        $data["haber_kat"]     = $this->user_model->haber_kat(5);
        $data["linkler"]       = $this->user_model->linkler();
        $data["proje_kat_tum"] = $this->user_model->proje_kat(100);
        $kat_id                = $this->user_model->kat_id_getir($prop);
        //  $data["alt_kat"]   = $this->user_model->alt_kat($kat_id);
        $n                     = 0;if ($data["proje_kat_tum"]): foreach ($data["proje_kat_tum"] as $dizi):
                $data["alt_kat"][$n] = $this->user_model->alt_kat($dizi["kategori_id"]);
                $n                   = $n + 1;endforeach;endif;
       // $data["kat_bilgi"]     = $this->user_model->kat_bilgi($prop);
        $data["kat_proje"]     = $this->user_model->page($prop,$p);
		
        $data["say"]       = count($this->user_model->page_tum($prop));
        $data["page"]      = ceil($data["say"] / 21);
        $data["p"]         = $p;		
        $data["prop"]         = $prop;		
		
        $data["canonical"]     = base_url()."" . $prop;
        $data["alter"]         = base_url()."ar/" . $prop;
		$data["link_3"]     = base_url()."frs/" . $prop;
        $this->load->view('frs/page', $data);
        $this->cache_foot("cache/page_" . $prop . "_en.php");

    }
	
	 public function rent_sale($prop = null,$p = null)
    {
		
 $this->dil();
        //prop'a göre kat_id getir

        $this->cache_head("cache/kategori_" . $prop . "_en.php");
        $this->load->model('user_model');
        $data["ayar"]          = $this->user_model->ayar();
        $data["proje_kat"]     = $this->user_model->proje_kat(7);
        $data["haber_kat"]     = $this->user_model->haber_kat(5);
        $data["linkler"]       = $this->user_model->linkler();
        $data["proje_kat_tum"] = $this->user_model->proje_kat(100);
        $kat_id                = $this->user_model->kat_id_getir($prop);
        //  $data["alt_kat"]   = $this->user_model->alt_kat($kat_id);
        $n                     = 0;if ($data["proje_kat_tum"]): foreach ($data["proje_kat_tum"] as $dizi):
                $data["alt_kat"][$n] = $this->user_model->alt_kat($dizi["kategori_id"]);
                $n                   = $n + 1;endforeach;endif;
       // $data["kat_bilgi"]     = $this->user_model->kat_bilgi($prop);
        $data["kat_proje"]     = $this->user_model->rs($prop,$p);
		
        $data["say"]       = count($this->user_model->rs_tum($prop));
        $data["page"]      = ceil($data["say"] / 21);
        $data["p"]         = $p;		
        $data["prop"]         = $prop;		
		
        $data["canonical"]     = base_url()."" . $prop;
        $data["alter"]         = base_url()."ar/" . $prop;
		$data["link_3"]     = base_url()."frs/" . $prop;
        $this->load->view('frs/page', $data);
        $this->cache_foot("cache/page_" . $prop . "_en.php");

    }

    public function proje_kategori_tum($p=null)
    {$this->dil();
        //prop'a göre kat_id getir

        $this->cache_head("cache/kategori_tum_frs.php");
        $this->load->model('user_model');
        $data["ayar"]          = $this->user_model->ayar();
        $data["proje_kat"]     = $this->user_model->proje_kat(7);
        $data["haber_kat"]     = $this->user_model->haber_kat(5);
        $data["linkler"]       = $this->user_model->linkler();
        $data["proje_kat_tum"] = $this->user_model->proje_kat(100);
        //  $kat_id = $this->user_model->kat_id_getir($prop);
        //  $data["alt_kat"]   = $this->user_model->alt_kat($kat_id);
        $n                     = 0;if ($data["proje_kat_tum"]): foreach ($data["proje_kat_tum"] as $dizi):
                $data["alt_kat"][$n] = $this->user_model->alt_kat($dizi["kategori_id"]);
                $n                   = $n + 1;endforeach;endif;
        $data["kat_bilgi"][]   = "";
        $data["kat_proje"]     = $this->user_model->tum_proje_2($p);
        $data["say"] = count($this->user_model->tum_proje_tum_2());
		$data["page"]=ceil($data["say"]/21);
		$data["p"]=$p;	
        $data["canonical"]     = base_url()."frs/projects";
        $data["alter"]       = base_url()."projects";
		$data["link_3"]     = base_url()."ar/projects";
        $this->load->view('frs/kategori_tum', $data);
        $this->cache_foot("cache/kategori_tum_frs.php");

    }

    public function haber_kategori_tum($p=null)
    {	$this->dil();
	


        $this->cache_head("cache/news_frs.php");
        $this->load->model('user_model');
        $data["ayar"]          = $this->user_model->ayar();
        $data["proje_kat"]     = $this->user_model->proje_kat(7);
        $data["haber_kat"]     = $this->user_model->haber_kat(5);
        $data["linkler"]       = $this->user_model->linkler();
        $data["haber_kat_tum"] = $this->user_model->haber_kat();
        $data["kat_haber"]     = $this->user_model->kat_haber_tum($p);
        $data["kat_haber_manset"]     = $this->user_model->kat_haber_manset();
        $data["kat_haber_manset_3"]     = $this->user_model->kat_haber_manset_3();				
        $data["kat_haber_manset_buyuk"]     = $this->user_model->kat_haber_manset_buyuk();	
        $data["say"] = count($this->user_model->kat_haber_tum_hepsi());
		$data["page"]=ceil($data["say"]/40);
		$data["p"]=$p;	
        $data["prop"]          = "";
        $data["canonical"]     = base_url()."frs/news";
        $data["alter"]       = base_url()."news";
		$data["link_3"]     = base_url()."ar/news";
        $this->load->view('frs/haber_kategori', $data);
        $this->cache_foot("cache/news_frs.php");
    }

    public function haber_kategori($prop = null,$p = null)
    {$this->dil();

        //prop'a göre kat_id getir

        $this->cache_head("cache/haber_kategori_" . $prop . "_frs.php");
        $this->load->model('user_model');
        $data["ayar"]          = $this->user_model->ayar();
        $data["proje_kat"]     = $this->user_model->proje_kat(7);
        $data["haber_kat"]     = $this->user_model->haber_kat(5);
        $data["linkler"]       = $this->user_model->linkler();
        $data["haber_kat_tum"] = $this->user_model->haber_kat();
        if ($prop == "buyer_guide") {
            $hb_kt_id              = 0;
            $data["haber_kat_adi"] = $this->session->userdata('buyer_guide');} else {
            $hb_kt_id              = $this->user_model->haber_kat_id_getir($prop);
            $data["haber_kat_adi"] = $this->user_model->haber_kat_adi_frs($prop);}
        $data["kat_haber"]       = $this->user_model->kat_haber($hb_kt_id,$p);
        
      //  $data["kat_haber_manset"]     = $this->user_model->kat_haber_manset_2($hb_kt_id);
      //  $data["kat_haber_manset_buyuk"]     = $this->user_model->kat_haber_manset_2_buyuk($hb_kt_id);
      
      		$data["say"]       = count($this->user_model->kat_haberler_adet($hb_kt_id));
        $data["page"]      = ceil($data["say"] / 12);
        $data["p"]         = $p;	
        
           $data["kat_haber_manset"]     = $this->user_model->kat_haber_manset();
        $data["kat_haber_manset_buyuk"]     = $this->user_model->kat_haber_manset_buyuk();	        
         $data["kat_haber_manset_3"]     = $this->user_model->kat_haber_manset_3();	       
        
        
        $data["prop"]            = $prop;
        $data["haber_kat_bilgi"] = $this->user_model->haber_kat_bilgi($prop);
        $data["canonical"]       = base_url()."frs/" . $prop;
        $data["alter"]       = base_url()."". $prop;
		$data["link_3"]     = base_url()."ar/" . $prop;
        $this->load->view('frs/haber_kategori', $data);
        $this->cache_foot("cache/haber_kategori_" . $prop . "_frs.php");
    }

    public function proje($prop = null)
    {$this->dil();
        $this->cache_head("cache/proje_" . $prop . "_frs.php");
        $this->load->model('user_model');
        $data["ayar"]        = $this->user_model->ayar();
        $data["proje_kat"]   = $this->user_model->proje_kat(7);
        $data["haber_kat"]   = $this->user_model->haber_kat(5);
        $data["linkler"]     = $this->user_model->linkler();
        $data["proje_detay"] = $this->user_model->proje_detay($prop);
        if ($data["proje_detay"]): foreach ($data["proje_detay"] as $dizi):
            $kat_id=$dizi["kategori"];
                $data["kat"]     = $this->user_model->proje_kat_adi_id_frs($dizi["kategori"]);
                $data["seo_adi"] = $this->user_model->proje_kat_seo_adi($dizi["kategori"]);
                $prj_id          = $dizi["proje_id"];
            endforeach;endif;
        $data["proje_ozellik"] = $this->user_model->proje_ozellik_getir($prj_id);
        $data["unite_tip"]     = $this->user_model->unite_tip_getir($prj_id);
        $data["proje_tip"]     = $this->user_model->proje_tip_getir($prj_id);
        $data["proje_resim"]   = $this->user_model->proje_resim_getir($prj_id);

        $data["proje_tip_ad"][]     = "";
        $data["unite_tip_ad"][]     = "";
        $n                          = 0;if ($data["unite_tip"]): foreach ($data["unite_tip"] as $dizi):
                $data["unite_tip_ad"][$n] = $this->user_model->unite_tip_ad_getir_frs($dizi["unite_tip_id"]);
                $n                        = $n + 1;endforeach;endif;
        $n                          = 0;if ($data["proje_tip"]): foreach ($data["proje_tip"] as $dizi):
                $data["proje_tip_ad"][$n] = $this->user_model->proje_tip_ad_getir_frs($dizi["proje_tip_id"]);
                $n                        = $n + 1;endforeach;endif;
        $data["canonical"]          = base_url()."frs/" . $prop;
        $data["alter"]       = base_url()."". $prop;
		$data["link_3"]     = base_url()."ar/" . $prop;
        $data["benzer_proje"]       = $this->user_model->benzer_proje_getir($kat_id);
         $data["emlaklar"]       = $this->user_model->emlak_getir($prj_id);
         $data["benzer_proje_daire"]       = $this->user_model->benzer_proje_daire($prj_id);		 
         $data["benzer_proje_villa"]       = $this->user_model->benzer_proje_villa($prj_id);		 
         $data["benzer_proje_arsa"]       = $this->user_model->benzer_proje_arsa($prj_id);		 
		 
		 
		 
        $this->load->view('frs/proje', $data);
        $this->cache_foot("cache/proje_" . $prop . "_frs.php");
    }

    public function haber($prop = null)
    {$this->dil();

        $this->cache_head("cache/haber_" . $prop . "_frs.php");
        $this->load->model('user_model');
        $data["ayar"]         = $this->user_model->ayar();
        $data["proje_kat"]    = $this->user_model->proje_kat(7);
        $data["haber_kat"]    = $this->user_model->haber_kat(5);
        $data["linkler"]      = $this->user_model->linkler();
        $data["haber_detay"]  = $this->user_model->haber_buyer_detay($prop);
        $data["benzer_haber"] = $this->user_model->benzer_haber_buyer("haber", $prop);
        if ($data["haber_detay"]): foreach ($data["haber_detay"] as $dizi):
                $data["kat"]     = $this->user_model->haber_kat_adi_id_frs($dizi["kategori_id"]);
                $data["seo_adi"] = $this->user_model->haber_kat_seo_adi($dizi["kategori_id"]);
            endforeach;endif;
        $data["prop"]            = $prop;
        $data["haber_buyer_adi"] = $this->user_model->haber_buyer_adi_frs($prop);
        $data["canonical"]       = base_url()."frs/" . $prop;
        $data["alter"]       = base_url()."". $prop;
		$data["link_3"]     = base_url()."ar/" . $prop;
        $this->load->view('frs/haber_buyer', $data);
        $this->cache_foot("cache/haber_" . $prop . "_frs.php");

    }

    public function buyer($prop = null)
    {$this->dil();

        $this->cache_head("cache/buyer_" . $prop . "_frs.php");
        $this->load->model('user_model');
        $data["ayar"]            = $this->user_model->ayar();
        $data["proje_kat"]       = $this->user_model->proje_kat();
        $data["haber_kat"]       = $this->user_model->haber_kat(5);
        $data["linkler"]         = $this->user_model->linkler();
        $data["haber_detay"]     = $this->user_model->haber_buyer_detay($prop);
        $data["benzer_haber"]    = $this->user_model->benzer_haber_buyer("buyer", $prop);
        $data["kat"]             = $this->session->userdata('buyer_guide');
        $data["seo_adi"]         = $this->session->userdata('buyer_guide_seo');
        $data["prop"]            = $prop;
        $data["haber_buyer_adi"] = $this->user_model->haber_buyer_adi_frs($prop);
        $data["canonical"]       = base_url()."frs/" . $prop;
        $data["alter"]       = base_url()."". $prop;
		$data["link_3"]     = base_url()."ar/" . $prop;
        $this->load->view('frs/haber_buyer', $data);
        $this->cache_foot("cache/buyer_" . $prop . "_frs.php");
    }

}
