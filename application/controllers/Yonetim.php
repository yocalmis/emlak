<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Yonetim extends CI_Controller
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

        if ($this->session->userdata('ln') == "") {
            $this->lng("en");
        }

    }

    public function login_kontrol($online)
    {

        if (empty($online)) {
            $this->load->library('messages');
            $this->load->model('admin_model');
            $sonuc = $this->admin_model->admin_query();

            if ($sonuc) {
            //    echo $this->messages->To_Login('yonetim');
                return false;
            } else {
                echo $this->messages->To_Register('yonetim');
                return false;

            }

        } else {
            return true;
        }

    }

    public function index()
    {

        $online = $this->session->userdata('adminonline');
        if (empty($online)) {

            $this->load->model('admin_model');
            $sonuc = $this->admin_model->admin_query();

            if ($sonuc) {$this->load->view('admin_login');} else { $this->load->view('admin_register');}

        } else {

            $this->load->model('admin_model');
            //     $this->load->view('anasayfa');

            redirect("yonetim/ayar/edit/1");

        }

    }

    public function adminkayit()
    {

        $this->load->library('Messages');
        echo $this->messages->config('yonetim');
        return false;

        $online = $this->session->userdata('adminonline');
        if (empty($online)) {

            $this->load->model('admin_model');
            $sonuc = $this->admin_model->admin_query();

            if ($sonuc) {$this->load->view('admin_register');} else { $this->load->view('admin_register');}

        } else {

            $this->load->library('messages');
            $this->messages->config('yonetim');

        }

    }

    //Admin Kaydet

    public function adminkaydet()
    {

        $this->load->library('Messages');
        echo $this->messages->config('yonetim');
        return false;

        error_reporting(0);

        $name     = $this->input->post('adi', true);
        $name     = trim($name);
        $name     = strip_tags($name);
        $name     = htmlentities($name);
        $email    = $this->input->post('email', true);
        $email    = trim($email);
        $email    = strip_tags($email);
        $email    = htmlentities($email);
        $username = $this->input->post('kullanici', true);
        $username = trim($username);
        $username = strip_tags($username);
        $username = htmlentities($username);
        $pass1    = $this->input->post('sifre1', true);
        $pass1    = trim($pass1);
        $pass1    = strip_tags($pass1);
        $pass1    = htmlentities($pass1);
        $pass2    = $this->input->post('sifre2', true);
        $pass2    = trim($pass2);
        $pass2    = strip_tags($pass2);
        $pass2    = htmlentities($pass2);
        $bina_adi = $this->input->post('bina_adi', true);
        $bina_adi = trim($bina_adi);
        $bina_adi = strip_tags($bina_adi);
        $bina_adi = htmlentities($bina_adi);

        $this->load->library('messages');

        if ($pass1 != $pass2) {

            echo $this->messages->Pass_Error('yonetim');

        } else {

            $pass = md5($pass1);

            $data = array($name, $email, $username, $pass, $bina_adi);
            $this->load->model('admin_model');
            $admin_register_before = $this->admin_model->admin_register_before($username, $email);

            if ($admin_register_before) {

                echo $this->messages->False_Add('yonetim/adminkayit');

            } else {

                $return = $this->admin_model->admin_register($data);

                if ($return) {
                    $url = base_url();
                    $this->load->library('mail/eposta');
                    $this->eposta->kayit($url, $name, $email, $return);

                    echo $this->messages->True_Add('yonetim');
                } else {

                    echo $this->messages->False_Add('yonetim');
                }

                return false;
            }

        }

        echo $this->messages->False_Add('yonetim');

    }

    public function success($pass)
    {
        error_reporting(0);
        $this->load->library('Messages');
        $this->load->model('admin_model');

        $uye_onay = $this->admin_model->uye_onay($pass);

        if ($uye_onay == 1) {

            $mails = $this->admin_model->mails($pass);

            $url = base_url();
            $this->load->library('mail/eposta');
            $this->eposta->kayit_onay_bilgi($url, $mails);

            echo $this->messages->True_Onay_Message('yonetim');
            return false;

        }

        echo $this->messages->False_Onay_Message('yonetim/adminkayit');
        return false;

    }

    public function kontrol()
    {

        $username = $this->input->post('kullanici', true);
        $pass     = $this->input->post('sifre', true);
        $pass     = md5($pass);

        $data = array($username, $pass);
        $this->load->library('messages');
        $this->load->model('admin_model');
        $return = $this->admin_model->admin_return($data);

        if ($return != 0) {

            $bilgi = $this->admin_model->admin_bilgi($data);

            if ($bilgi): foreach ($bilgi as $dizi):

                    $id           = $dizi["id"];
                    $kullanici_id = $dizi["kullanici_id"];
                    $name         = $dizi["name"];
                    $email        = $dizi["email"];
                    $uye_turu     = $dizi["uye_turu"];

                    $yetki = $dizi["yetki"];

                endforeach;endif;

            //    $para_birimi=$this->admin_model->para_birimi($kullanici_id);

            /*    if( $para_birimi ) :  foreach( $para_birimi as $dizi ) :

            $para_birim=$dizi["para_birim"];
            $bina_adi=$dizi["adi"];

            endforeach;  endif;
             */

            $this->session->set_userdata('adminonline', $username);
            $online = $this->session->userdata('adminonline');

            $this->session->set_userdata('id', $id);
            $id = $this->session->userdata('id');

            $this->session->set_userdata('name', $name);
            $name = $this->session->userdata('name');

            $this->session->set_userdata('email', $email);
            $email = $this->session->userdata('email');

            $this->session->set_userdata('uye_turu', $uye_turu);
            $uye_turu = $this->session->userdata('uye_turu');

            $this->session->set_userdata('kullanici_id', $kullanici_id);
            $kullanici_id = $this->session->userdata('kullanici_id');

/*    $this->session->set_userdata('para_birim',$para_birim);
$para_birim=$this->session->userdata('para_birim');
 */
            if ($return == 2) {$odeme = 1;} else { $odeme = 2;}

            $this->session->set_userdata('odeme', $odeme);
            $odeme = $this->session->userdata('odeme');

            $this->session->set_userdata('yetki', $yetki);
            $yetki = $this->session->userdata('yetki');

/*    $this->session->set_userdata('bina_adi',$bina_adi);
$bina_adi=$this->session->userdata('bina_adi');
 */
            $anahtar = md5($this->session->userdata('kullanici_id') . "_" . $this->session->userdata('id'));
            $this->session->set_userdata('anahtar', $anahtar);

            echo $this->messages->Welcome('yonetim', $online);

        } else {
            echo $this->messages->Welcome_False('yonetim');
        }

    }

    public function cikis()
    {
        $this->load->library('messages');
        $this->session->unset_userdata('adminonline');
        $this->session->unset_userdata('odeme');
        $this->session->sess_destroy();
        echo $this->messages->Logout('yonetim');

    }

    public function pass_remember()
    {
        error_reporting(0);
        $online = $this->session->userdata('adminonline');
        if (empty($online)) {

            $this->load->view('forgot-pass.php');
            return false;
        }

        $this->load->library('Messages');
        echo $this->messages->config('yonetim');
        return false;

    }

    public function new_pass()
    {

        error_reporting(0);
        $online = $this->session->userdata('adminonline');
        if (empty($online)) {

            $this->load->model('admin_model');
            $sonuc = $this->admin_model->admin_query();

            if ($sonuc) {$this->load->view('admin_register');} else { $this->load->view('admin_register');}

        }

        $this->load->library('Messages');
        $this->load->model('admin_model');
        $email = $this->input->post('my-mail', true);
        $email = trim($email);
        $email = htmlentities($email);
        $email = strip_tags($email);
        $email = strtolower($email);

        if ($email == "") {
            echo $this->messages->config('');
            return false;
        }

        $return = $this->admin_model->kontrol($email);

        if ($return != 1) {

            echo $this->messages->False_Bulunamadi('yonetim/pass_remember');

        }

        if ($return == 1) {

            $pass = $this->admin_model->pass_getir($email);

            $this->load->library('mail/eposta');
            $mail = $this->eposta->new_pass(base_url(), $pass, $email);

            if ($mail == true) {
                $this->load->library('Messages');
                echo $this->messages->New_Pass('');

            }

        }

    }

    public function new_pass_success($pass)
    {
        error_reporting(0);
        $useronline = $this->session->userdata('useronline');
        if ($useronline != "") {
            $this->load->library('Messages');
            echo $this->messages->config('');
            return false;

        }

        $data["pass"] = $pass;
        $this->load->view('new-pass.php', $data);

    }

    public function new_pass_success_ok()
    {
        error_reporting(0);
        $useronline = $this->session->userdata('useronline');
        if ($useronline != "") {
            $this->load->library('Messages');
            echo $this->messages->config('');
            return false;

        }
        $pass = $this->input->post('pass', true);
        $ps   = $this->input->post('ps', true);
        $ps2  = $this->input->post('ps2', true);

        $pass = trim($pass);
        $ps   = trim($ps);
        $ps2  = trim($ps2);

        $pass = trim($pass);
        $ps   = htmlentities($ps);
        $ps2  = htmlentities($ps2);

        $pass = trim($pass);
        $ps   = strip_tags($ps);
        $ps2  = strip_tags($ps2);

        if ($ps != $ps2) {

            $this->load->library('Messages');
            echo $this->messages->Pass_Error('yonetim');
            return false;
        }

        $sf = md5($ps);
        $this->load->model('admin_model');

        $sifre_guncelle = $this->admin_model->sifre_guncelle($sf, $pass);

        if ($sifre_guncelle != 1) {
            $this->load->library('Messages');
            echo $this->messages->New_Pass_False('yonetim');
            return false;

        }

        $this->load->library('Messages');
        echo $this->messages->New_Pass_True('yonetim');

        return false;

    }

    public function ayar()
    {
        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $this->load->model('admin_model');
            $uye_turu = $this->admin_model->uye_turu_getir($online);

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();
            if ($state == 'edit') {
                $primary_key = $state_info->primary_key;

                if ($primary_key != 1) {

                    $this->load->library('messages');
                    echo $this->messages->config('yonetim');
                    return false;

                }

            }

            $crud->set_theme('flexigrid');
            $crud->set_table('ayar');

            $crud->set_subject('Ayarlar');
            $crud->columns('facebook', 'twitter', 'instagram', 'email', 'tel_1');
            $crud->display_as('web_url', 'Site adresi');
            $crud->display_as('email', 'E-Mail');
            $crud->display_as('tel_1', 'Telefon');
            $crud->display_as('tel_2', 'Telefon 2');
            $crud->display_as('fax', 'Fax');
            $crud->display_as('company_name', 'Yetkili Kişi');
            $crud->display_as('adress', 'Adres');
            $crud->display_as('home_slogan', 'Anasayfa Üst Slogan');
            $crud->display_as('seo_keywords', 'Anahtar Kelimeler');
            $crud->display_as('maps', 'Google Harita Linki');
            $crud->display_as('home_photo', 'Anasayfa Üst Resim 1920*1080');
            $crud->display_as('ana_arkaplan', 'Ana Arka Plan 1921*795');
            $crud->display_as('otel_photo', 'Otel Üst Resim 1920*1080');
            $crud->display_as('otel_slogan', 'Otel Üst Slogan');
            $crud->set_field_upload('ana_arkaplan', 'assets/resimler');

            $crud->unset_add();
            $crud->unset_read();
            $crud->unset_delete();
            $crud->unset_export();
            $crud->unset_print();
            $crud->unset_back_to_list();

            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("kisa_aciklama_ar", "uzun_aciklama_ar", "adress_ar", "whatsapp_ar", "tel_1_ar", "tel_2_ar", "fax_ar", "ana_arkaplan_yazi_ar", "ana_arkaplan"
                    , "anasayfa_description_ar", "contact_description_ar", "proje_description_ar", "news_description_ar", "anasayfa_title_ar", "contact_title_ar", "proje_title_ar", "news_title_ar",
					"kisa_aciklama_frs", "uzun_aciklama_frs", "adress_frs", "whatsapp_frs", "tel_1_frs", "tel_2_frs", "fax_frs", "ana_arkaplan_yazi_frs"
                    , "ana_description_frs", "contact_description_frs", "proje_description_frs", "news_description_frs", "anasayfa_title_frs", "contact_title_frs", "proje_title_frs", "news_title_frs","anasayfa_description_frs"
					);
                $crud->unset_edit_fields("kisa_aciklama_ar", "uzun_aciklama_ar", "adress_ar", "whatsapp_ar", "tel_1_ar", "tel_2_ar", "fax_ar", "ana_arkaplan_yazi_ar", "ana_arkaplan"
                    , "anasayfa_description_ar", "contact_description_ar", "proje_description_ar", "news_description_ar", "anasayfa_title_ar", "contact_title_ar", "proje_title_ar", "news_title_ar",
					"kisa_aciklama_frs", "uzun_aciklama_frs", "adress_frs", "whatsapp_frs", "tel_1_frs", "tel_2_frs", "fax_frs", "ana_arkaplan_yazi_frs"
                    , "ana_description_frs", "contact_description_frs", "proje_description_frs", "news_description_frs", "anasayfa_title_frs", "contact_title_frs", "proje_title_frs", "news_title_frs","anasayfa_description_frs");
                $crud->required_fields('email', 'tel_1', "adress", 'company_name', 'adress_ar', 'whatsapp_ar', 'tel_1', 'tel_2_ar', 'fax_ar');
            }
			
            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("kisa_aciklama", "uzun_aciklama", "adress", "whatsapp", "tel_1", "tel_2", "fax", "facebook", "twitter", "google", "instagram", "linkedin", "pinterest", "youtube", "email", "email_2", "tel_1"
                    , "tel_2", "fax", "adress", "company_name", "seo_keywords", "maps", "kisa_aciklama", "uzun_aciklama", "ana_arkaplan_yazi", "ana_arkaplan",
					"kisa_aciklama_frs", "uzun_aciklama_frs", "adress_frs", "whatsapp_frs", "tel_1_frs", "tel_2_frs", "fax_frs", "ana_arkaplan_yazi_frs"
                    , "ana_description_frs", "contact_description_frs", "proje_description_frs", "news_description_frs", "anasayfa_title_frs", "contact_title_frs", "proje_title_frs", "news_title_frs","anasayfa_description_frs"
                    , "anasayfa_description", "contact_description", "proje_description", "news_description", "anasayfa_title", "contact_title", "proje_title", "news_title");
                $crud->unset_edit_fields("kisa_aciklama", "uzun_aciklama", "adress", "whatsapp", "tel_1", "tel_2", "fax", "facebook", "twitter", "google", "instagram", "linkedin", "pinterest", "youtube", "email", "email_2", "tel_1"
                    , "tel_2", "fax", "adress", "company_name", "seo_keywords", "maps", "kisa_aciklama", "uzun_aciklama", "ana_arkaplan_yazi", "ana_arkaplan",
					"kisa_aciklama_frs", "uzun_aciklama_frs", "adress_frs", "whatsapp_frs", "tel_1_frs", "tel_2_frs", "fax_frs", "ana_arkaplan_yazi_frs"
                    , "ana_description_frs", "contact_description_frs", "proje_description_frs", "news_description_frs", "anasayfa_title_frs", "contact_title_frs", "proje_title_frs", "news_title_frs","anasayfa_description_frs"
                    , "anasayfa_description", "contact_description", "proje_description", "news_description", "anasayfa_title", "contact_title", "proje_title", "news_title");
                $crud->required_fields('email', 'tel_1', "adress", 'company_name', 'adress_ar', 'whatsapp', 'tel_1', 'tel_2_ar', 'fax_ar');
            }
		   if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("kisa_aciklama", "uzun_aciklama", "adress", "whatsapp", "tel_1", "tel_2", "fax", "facebook", "twitter", "google", "instagram", "linkedin", "pinterest", "youtube", "email", "email_2", "tel_1"
                    , "tel_2", "fax", "adress", "company_name", "seo_keywords", "maps", "kisa_aciklama", "uzun_aciklama", "ana_arkaplan_yazi", "ana_arkaplan",
					"kisa_aciklama_ar", "uzun_aciklama_ar", "adress_ar", "whatsapp_ar", "tel_1_ar", "tel_2_ar", "fax_ar", "ana_arkaplan_yazi_ar", "ana_arkaplan"
                    , "anasayfa_description_ar", "contact_description_ar", "proje_description_ar", "news_description_ar", "anasayfa_title_ar", "contact_title_ar", "proje_title_ar", "news_title_ar",
                     "anasayfa_description", "contact_description", "proje_description", "news_description", "anasayfa_title", "contact_title", "proje_title", "news_title");
                $crud->unset_edit_fields("kisa_aciklama", "uzun_aciklama", "adress", "whatsapp", "tel_1", "tel_2", "fax", "facebook", "twitter", "google", "instagram", "linkedin", "pinterest", "youtube", "email", "email_2", "tel_1"
                    , "tel_2", "fax", "adress", "company_name", "seo_keywords", "maps", "kisa_aciklama", "uzun_aciklama", "ana_arkaplan_yazi", "ana_arkaplan",
					"kisa_aciklama_ar", "uzun_aciklama_ar", "adress_ar", "whatsapp_ar", "tel_1_ar", "tel_2_ar", "fax_ar", "ana_arkaplan_yazi_ar", "ana_arkaplan"
                    , "anasayfa_description_ar", "contact_description_ar", "proje_description_ar", "news_description_ar", "anasayfa_title_ar", "contact_title_ar", "proje_title_ar", "news_title_ar",
                     "anasayfa_description", "contact_description", "proje_description", "news_description", "anasayfa_title", "contact_title", "proje_title", "news_title");
                $crud->required_fields('email', 'tel_1', "adress", 'company_name', 'adress_ar', 'whatsapp', 'tel_1', 'tel_2_frs', 'fax_frs');
            }	
			
			
			
			

$crud->display_as('adress_ar','adress_tr');
$crud->display_as('kisa_aciklama_ar','kisa_aciklama_tr');
$crud->display_as('uzun_aciklama_ar','uzun_aciklama_tr');
$crud->display_as('tel_1_ar','tel_1_tr');
$crud->display_as('whatsapp_ar','whatsapp_tr');
$crud->display_as('tel_2_ar','tel_2_tr');
$crud->display_as('fax_ar','fax_tr');
$crud->display_as('ana_arkaplan_yazi_ar','ana_arkaplan_yazi_tr');
$crud->display_as('anasayfa_description_ar','anasayfa_description_tr');
$crud->display_as('contact_description_ar','contact_description_tr');
$crud->display_as('proje_description_ar','proje_description_tr');
$crud->display_as('news_description_ar','news_description_tr');
$crud->display_as('anasayfa_title_ar','anasayfa_title_tr');
$crud->display_as('contact_title_ar','contact_title_tr');
$crud->display_as('proje_title_ar','proje_title_tr');
$crud->display_as('news_title_ar','news_title_tr');
$crud->display_as('adress_frs','adress_rus');
$crud->display_as('kisa_aciklama_frs','kisa_aciklama_rus');
$crud->display_as('tel_1_frs','tel_1_rus');
$crud->display_as('whatsapp_frs','whatsapp_rus');
$crud->display_as('tel_2_frs','tel_2_rus');
$crud->display_as('fax_frs','fax_rus');
$crud->display_as('ana_arkaplan_yazi_frs','ana_arkaplan_yazi_rus');
$crud->display_as('anasayfa_description_frs','ana_arkaplan_yazi_rus');
$crud->display_as('contact_description_frs','contact_description_rus');
$crud->display_as('proje_description_frs','proje_description_rus');
$crud->display_as('news_description_frs','news_description_rus');
$crud->display_as('anasayfa_title_frs','anasayfa_title_rus');
$crud->display_as('contact_title_frs','contact_title_rus');
$crud->display_as('proje_title_frs','proje_title_rus');
$crud->display_as('news_title_frs','news_title_rus');
$crud->display_as('uzun_aciklama_frs','uzun_aciklama_rus'); 			
			

            $data['side_menu'] = "ayar";
            $data['kilavuz']   = "  <b>Sistem Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }}

    public function bilgi($edit = null, $id = null)
    {
        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $this->load->model('admin_model');
            $uye_id = $this->admin_model->uye_id_getir($online);

            if ($id != $uye_id) {

                $this->load->library('Messages');
                echo $this->messages->config('yonetim');
                return false;

            }

            $crud = new grocery_CRUD();
            $crud->set_theme('flexigrid');
            $crud->set_table('uyeler');
            $crud->where('username', $online);
            $crud->set_subject('bilgi');
            $crud->columns('name', 'username', 'pass', 'email');
            $crud->display_as('name', 'Adı Soyadı');
            $crud->display_as('username', 'Kullanıcı Adı');
            $crud->display_as('pass', 'Şifre (Eski veya yeni şifre)');
            $crud->display_as('email', 'E-Mail');
            $crud->display_as('status', 'Admin Türü');
            $crud->required_fields('name', 'pass', 'email', 'username');
            $crud->unset_fields('status', "bas_tar", "bit_tar", "cari_id", "uye_turu", "kullanici_id", "yetki");
            $crud->unset_edit_fields('status', "bas_tar", "bit_tar", "cari_id", "uye_turu", "kullanici_id", "yetki");
            $crud->field_type('email', 'readonly');
            $crud->field_type('username', 'readonly');
            $crud->unset_add();
            $crud->unset_read();
            $crud->unset_delete();
            $crud->unset_export();
            $crud->unset_print();
            $crud->unset_back_to_list();
            $crud->change_field_type('pass', 'password');
            $crud->callback_before_update(array($this, 'encrypt_password_callback'));
            $crud->callback_before_insert(array($this, 'encrypt_password_callback'));

            $data['side_menu'] = "ayar";
            $data['kilavuz']   = "  <b>Admin Bilgi Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);

            $this->load->view('index', (array) $output);

        }
    }

    public function encrypt_password_callback($post_array, $primary_key = null)
    {
        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {
            if ($post_array['pass'] == '') {return false;} else {

                $post_array['pass'] = md5($post_array['pass']);
                return $post_array;

            }

        }

    }

    public function kategori($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('kategori');

            $crud->set_subject('Kategoriler');
            $crud->columns('kategori_adi', 'ebeveyn');

            //  $crud->field_type('ebeveyn', 'hidden');
            $crud->set_relation('ebeveyn', 'kategori', 'kategori_adi');
            $crud->field_type('seo_adi', 'hidden');

            $crud->set_field_upload('resim', 'assets/resimler');
            $crud->display_as('resim', 'Resim 286*358');
            $crud->callback_before_delete(array($this, 'kat_sil_kontrol'));

            $crud->callback_before_insert(array($this, 'kat_sef_kontrol'));
            $crud->callback_before_update(array($this, 'kat_sef_kontrol'));
            $crud->unset_clone();
            $crud->unset_back_to_list();
            $crud->set_relation('ebeveyn', 'kategori', 'kategori_adi');

            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("kategori_adi_ar", "kategori_aciklama_ar", "kategori_on_yazi_ar","kategori_adi_frs", "kategori_aciklama_frs", "kategori_on_yazi_frs");
                $crud->unset_edit_fields("kategori_adi_ar", "kategori_aciklama_ar", "kategori_on_yazi_ar","kategori_adi_frs", "kategori_aciklama_frs", "kategori_on_yazi_frs");
                $crud->required_fields('kategori_adi', 'resim');
            }
            if ($this->session->userdata('ln') == "ar") {
               $crud->unset_add_fields( "kategori_aciklama",  "resim", "kategori_on_yazi",'resim_alt','resim_title','description','title',"kategori_adi_frs", "kategori_aciklama_frs", "kategori_on_yazi_frs");
                 $crud->unset_edit_fields( "kategori_aciklama", "resim", "kategori_on_yazi",'resim_alt','resim_title','description','title',"kategori_adi_frs", "kategori_aciklama_frs", "kategori_on_yazi_frs");
              $crud->required_fields( 'kategori_adi_ar', "kategori_on_yazi", "kategori_on_yazi_ar");
            }
            if ($this->session->userdata('ln') == "frs") {
               $crud->unset_add_fields( "kategori_aciklama",  "resim", "kategori_on_yazi",'resim_alt','resim_title','description','description_ar','title_ar','title',"kategori_adi_ar", "kategori_aciklama_ar", "kategori_on_yazi_ar");
                 $crud->unset_edit_fields( "kategori_aciklama", "resim", "kategori_on_yazi",'resim_alt','resim_title','description','description_ar','title_ar','title',"kategori_adi_ar", "kategori_aciklama_ar", "kategori_on_yazi_ar");
              $crud->required_fields( 'kategori_adi_frs', "kategori_on_yazi", "kategori_on_yazi_frs");
            }
			
			
            $crud->display_as('kategori_adi_ar', 'kategori_adi_tr');			
            $crud->display_as('kategori_aciklama_ar', 'kategori_aciklama_tr');	
            $crud->display_as('kategori_on_yazi_ar', 'kategori_on_yazi_tr');	
            $crud->display_as('description_ar', 'description_tr');	
            $crud->display_as('title_ar', 'title_tr');	
            $crud->display_as('kategori_adi_frs', 'kategori_adi_rus');	
            $crud->display_as('kategori_aciklama_frs', 'kategori_aciklama_rus');	
            $crud->display_as('kategori_on_yazi_frs', 'kategori_on_yazi_rus');			
            $crud->display_as('description_frs', 'description_rus');	

			
			
			

            $data['side_menu'] = "Kategori Ayarları";
            $data['kilavuz']   = "  <b>Kategori Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }

    public function kat_sil_kontrol($primary_key)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $query = $this->db->query("select * from kategori Where kategori_id=" . $primary_key);
            foreach ($query->result_array() as $row) {
                unlink("assets/resimler/" . $row['resim']);
            }
            return true;

        }
        return false;
    }

    public function alt_kategori($edit = null, $id = null)
    {

        $this->load->library('Messages');
        echo $this->messages->config('');
        return false;

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('alt_kategori');

            $crud->set_subject('Kategoriler');
            $crud->columns('kategori_adi');

            $crud->field_type('seo_adi', 'hidden');
            $crud->set_field_upload('resim', 'assets/resimler');
            $crud->display_as('resim', 'Resim 286*358');
            $crud->set_relation('ebeveyn', 'kategori', 'kategori_adi');
            $crud->callback_before_insert(array($this, 'kat_sef_kontrol'));
            $crud->callback_before_update(array($this, 'kat_sef_kontrol'));
            $crud->unset_clone();
            $crud->unset_back_to_list();

            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("kategori_adi_ar");
                $crud->unset_edit_fields("kategori_adi_ar");
                $crud->required_fields('kategori_adi');
            }
            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("kategori_adi", "ebeveyn");
                $crud->unset_edit_fields("kategori_adi", "ebeveyn");
                $crud->required_fields('kategori_adi', 'kategori_adi_ar');
            }

            $data['side_menu'] = "Kategori Ayarları";
            $data['kilavuz']   = "  <b>Kategori Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }

    public function haber_kategori($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('haber_kategori');

            $crud->set_subject('Kategoriler');
            $crud->columns('kategori_adi');

            $crud->field_type('ebeveyn', 'hidden');
            $crud->field_type('seo_adi', 'hidden');

            $crud->callback_before_insert(array($this, 'kat_sef_kontrol'));
            $crud->callback_before_update(array($this, 'kat_sef_kontrol'));
            $crud->unset_clone();
            $crud->unset_back_to_list();

            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("kategori_adi_ar","kategori_adi_frs","title_frs","title_ar","description_ar","description_frs");
                $crud->unset_edit_fields("kategori_adi_ar","kategori_adi_frs","title_frs","title_ar","description_ar","description_frs");
                $crud->required_fields('kategori_adi');
            }
            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields( "ebeveyn", "seo_adi","kategori_adi_frs","title","description","title_frs","description_frs");
                $crud->unset_edit_fields( "ebeveyn", "seo_adi","kategori_adi_frs","title","description","title_frs","description_frs");
                $crud->required_fields( 'kategori_adi_ar');
            }
        if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields( "ebeveyn", "seo_adi","kategori_adi_ar","title","description",'description_ar','title_ar');
                $crud->unset_edit_fields( "ebeveyn", "seo_adi","kategori_adi_ar","title","description",'description_ar','title_ar');
                $crud->required_fields( 'kategori_adi_frs');
            }


            $crud->display_as('kategori_adi_ar', 'kategori_adi_tr');
            $crud->display_as('description_ar', 'description_tr');
            $crud->display_as('title_ar', 'title_tr');			
            $crud->display_as('kategori_adi_frs', 'kategori_adi_rus');
            $crud->display_as('title_frs', 'title_rus');
            $crud->display_as('description_frs', 'description_rus');
	
			
			
			
			
			

            $data['side_menu'] = "Kategori Ayarları";
            $data['kilavuz']   = "  <b>Kategori Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }

    public function dil_sabitleri()
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            if ($state == 'edit') {
                $crud->field_type('adi', 'readonly');

            }

            $crud->set_theme('flexigrid');
            $crud->set_table('dil');

            $crud->set_subject('Dil Sabit Değişkenleri');
            $crud->columns('adi', 'en');

            $crud->unset_clone();
            $crud->unset_back_to_list();
            $crud->unset_add();
            $crud->unset_delete();
			
            $crud->display_as('ar', 'tr');		
            $crud->display_as('frs', 'rus');			

            $data['side_menu'] = "Dil Sabit Değişken Ayarları";
            $data['kilavuz']   = "  <b>Dil Sabit Değişken Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }

    public function kat_sef_kontrol($post_array, $primary_key = null)
    {

        if ($post_array['ebeveyn'] != "") {
            $this->load->model('admin_model');
            $ebeveyn_adi = $this->admin_model->ebeveyn_adi_getir($post_array['ebeveyn']);
            if ($post_array['kategori_adi'] == $ebeveyn_adi) {return false;} else {

                $post_array['seo_adi'] = $this->seflink($post_array['kategori_adi']);
                return $post_array;

            }

        } else {

            $post_array['seo_adi'] = $this->seflink($post_array['kategori_adi']);
            return $post_array;

        }

    }

    public function sef_kontrol($post_array, $primary_key = null)
    {

        $post_array['seo_adi'] = $this->seflink($post_array['proje_adi']);
        return $post_array;

    }

    public function sef_kontrol_2($post_array, $primary_key = null)
    {

        $post_array['seo_adi'] = $this->seflink($post_array['baslik']);
        return $post_array;

    }

    public function seflink($text)
    {
        $find    = array('Ç', 'Ş', 'Ğ', 'Ü', 'İ', 'Ö', 'ç', 'ş', 'ğ', 'ü', 'ö', 'ı', '+', '#');
        $replace = array('c', 's', 'g', 'u', 'i', 'o', 'c', 's', 'g', 'u', 'o', 'i', 'plus', 'sharp');
        $text    = strtolower(str_replace($find, $replace, $text));
        $text    = preg_replace("@[^A-Za-z0-9\-_\.\+]@i", ' ', $text);
        $text    = trim(preg_replace('/\s+/', ' ', $text));
        $text    = str_replace(' ', '-', $text);
        return $text;
    }

    public function proje_ozellik($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('proje_ozellik');

            $crud->set_subject('Proje Özellikleri');

            $crud->callback_before_delete(array($this, 'proje_ozellik_sil_kontrol'));
            $crud->unset_clone();
            $crud->unset_back_to_list();
            //    $crud->unset_add();
           // $crud->unset_delete();
            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("ozellik_adi_ar","ozellik_adi_frs");
                $crud->unset_edit_fields("ozellik_adi_ar","ozellik_adi_frs");
                $crud->required_fields('ozellik_adi');
            }
            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("ozellik_adi","ozellik_adi_frs");
                $crud->unset_edit_fields("ozellik_adi","ozellik_adi_frs");
                $crud->required_fields('ozellik_adi', 'ozellik_adi_ar');
            }
            if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("ozellik_adi","ozellik_adi_ar");
                $crud->unset_edit_fields("ozellik_adi","ozellik_adi_ar");
                $crud->required_fields('ozellik_adi', 'ozellik_adi_frs');
            }

            $crud->display_as('ozellik_adi_ar', 'ozellik_adi_tr');
            $crud->display_as('ozellik_adi_frs', 'ozellik_adi_rus');



            $data['side_menu'] = "Proje Özellik Ayarları";
            $data['kilavuz']   = "  <b>Proje Özellik Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }

    public function proje_ozellik_sil_kontrol($primary_key)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {
            $this->load->model('admin_model');
            $this->load->library('Messages');
            $this->db->where('proje_ozellik_id', $primary_key);
            $this->db->delete('proje_ozellik_iliski');
            return true;

        }
        return false;
    }

    public function proje_tip($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('proje_tip');

            $crud->set_subject('Proje Tipleri');

            $crud->callback_before_delete(array($this, 'proje_tip_sil_kontrol'));
            $crud->unset_clone();
            $crud->unset_back_to_list();

            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("tip_adi_ar","tip_adi_frs");
                $crud->unset_edit_fields("tip_adi_ar","tip_adi_frs");
                $crud->required_fields('tip_adi');
            }
            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("tip_adi","tip_adi_frs");
                $crud->unset_edit_fields("tip_adi","tip_adi_frs");
                $crud->required_fields('tip_adi', 'tip_adi_ar');
            }
            if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("tip_adi","tip_adi_ar");
                $crud->unset_edit_fields("tip_adi","tip_adi_ar");
                $crud->required_fields('tip_adi', 'tip_adi_frs');
            }

            $crud->display_as('tip_adi_ar', 'tip_adi_tr');
            $crud->display_as('tip_adi_frs', 'tip_adi_rus');
			
			
			
			
            $data['side_menu'] = "Proje Tip Ayarları";
            $data['kilavuz']   = "  <b>Proje Tip Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }

    public function proje_tip_sil_kontrol($primary_key)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {
            $this->load->model('admin_model');
            $this->load->library('Messages');
            $this->db->where('proje_tip_id', $primary_key);
            $this->db->delete('proje_tip_iliski');
            return true;

        }
        return false;
    }

    public function unite_tip($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('unite_tip');

            $crud->set_subject('Ünite Tipleri');

            $crud->callback_before_delete(array($this, 'unite_tip_sil_kontrol'));
            $crud->unset_clone();
            $crud->unset_add();
            $crud->unset_edit();
            $crud->unset_back_to_list();

            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("unite_adi_ar","unite_adi_frs");
                $crud->unset_edit_fields("unite_adi_ar","unite_adi_frs");
                $crud->required_fields('unite_adi');
            }
            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("unite_adi","unite_adi_frs");
                $crud->unset_edit_fields("unite_adi","unite_adi_frs");
                $crud->required_fields('unite_adi', 'unite_adi_ar');
            }
             if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("unite_adi","unite_adi_ar");
                $crud->unset_edit_fields("unite_adi","unite_adi_ar");
                $crud->required_fields('unite_adi', 'unite_adi_frs');
            } 

            $crud->display_as('unite_adi_ar', 'unite_adi_tr');
            $crud->display_as('unite_adi_frs', 'unite_adi_rus');





            $data['side_menu'] = "Ünite Tip Ayarları";
            $data['kilavuz']   = "  <b>Ünite Tip Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }

    public function unite_tip_sil_kontrol($primary_key)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {
            $this->load->model('admin_model');
            $this->load->library('Messages');
            $this->db->where('unite_tip_id', $primary_key);
            $this->db->delete('unite_tip_iliski');
            return true;

        }
        return false;
    }

    public function proje($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('projeler');
            $crud->where('kategori!=', 0);
            $crud->where('type', 'proje');			
            $crud->set_subject('Projeler');
            $crud->columns('proje_adi', 'proje_tarih', 'min_fiyat', 'min_m2', 'Fotoğraflar');

            $crud->field_type('seo_adi', 'hidden');
            $crud->set_relation('kategori', 'kategori', 'kategori_adi');
            $crud->set_relation_n_n('proje_tipleri', 'proje_tip_iliski', 'proje_tip', 'proje_id', 'proje_tip_id', 'tip_adi', 'priority');
            $crud->set_relation_n_n('unite_tipleri', 'unite_tip_iliski', 'unite_tip', 'proje_id', 'unite_tip_id', 'unite_adi', 'priority');
            $crud->set_relation_n_n('ozellik_tipleri', 'proje_ozellik_iliski', 'proje_ozellik', 'proje_id', 'proje_ozellik_id', 'ozellik_adi', 'priority');
            $crud->callback_column('Fotoğraflar', array($this, 'callback_fotolar'));
            $crud->callback_before_delete(array($this, 'proje_sil_kontrol'));
            $crud->set_field_upload('banner_1', 'assets/resimler');
            $crud->set_field_upload('banner_2', 'assets/resimler');
            $crud->set_field_upload('banner_3', 'assets/resimler');
            $crud->display_as('banner_1', 'Banner 1 286*358');
            $crud->display_as('banner_2', 'Banner 2 285*281');
            $crud->display_as('banner_3', 'Banner 3 288*349');
            $crud->display_as('banner_3', 'Banner 3 288*349');	
			
            $crud->display_as('min_fiyat', 'Fiyat');
            $crud->display_as('min_fiyat_ar', 'Fiyat Ar');	
            $crud->display_as('sat_kir', 'Satılık mı?Kiralık mı?');	
            $crud->display_as('kat', 'Proje kat sayısı');
			
            $crud->callback_before_insert(array($this, 'sef_kontrol'));
            $crud->callback_before_update(array($this, 'sef_kontrol'));
            $crud->unset_clone();
            $crud->unset_back_to_list();
            $crud->unset_fields();
			
	            $crud->field_type('sat_kir', 'dropdown',
                array('1' => 'Satılık', '0' => 'Kiralık'));		
			
            $crud->field_type('type', 'hidden', 'proje');
			
            $crud->set_field_upload('dosya', 'assets/resimler');		
			
            $crud->field_type('balkon', 'hidden');	
            $crud->field_type('proje', 'hidden');	




			
            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","max_fiyat", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->unset_edit_fields("proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","max_fiyat", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->required_fields('proje_adi', "proje_yeri", 'kategori', 'proje_tarih', 'min_fiyat',  'min_m2', 'max_m2', 'telefon', 'Aciklama', 'banner_1'
                    , 'banner_2', 'banner_3');
            }


            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->unset_edit_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->required_fields('proje_adi', "proje_yeri_ar", 'kategori', 'proje_tarih', 'proje_tarih_ar', 'min_fiyat',  'min_m2', 'max_m2', 'telefon', 'Aciklama', 'proje_adi_ar', 'min_fiyat_ar', 'min_m2_ar', 'max_m2_ar', 'telefon_ar', 'Aciklama_ar'
                    , 'banner_1', 'banner_2', 'banner_3');
            }

         if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","max_fiyat_frs", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar");
                $crud->unset_edit_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","max_fiyat_frs", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar");
                $crud->required_fields('proje_adi', "proje_yeri_frs", 'kategori', 'proje_tarih', 'proje_tarih_frs', 'min_fiyat',  'min_m2', 'max_m2', 'telefon', 'Aciklama', 'proje_adi_frs', 'min_fiyat_frs', 'min_m2_frs', 'max_m2_frs', 'telefon_frs', 'Aciklama_frs'
                    , 'banner_1', 'banner_2', 'banner_3');
            }


 $crud->display_as('proje_adi_ar','proje_adi_tr');  
 $crud->display_as('proje_yeri_ar','proje_yeri_tr');  
 $crud->display_as('min_fiyat_ar','min_fiyat_tr');  
 $crud->display_as('max_fiyat_ar','max_fiyat_tr');  
 $crud->display_as('min_m2_ar','min_m2_tr');  
 $crud->display_as('max_m2_ar','max_m2_tr');  
 $crud->display_as('proje_durum_ar','proje_durum_tr');  
 $crud->display_as('total_apartments_ar','total_apartments_tr');  
 $crud->display_as('total_land_side_ar','total_land_side_tr');  
 $crud->display_as('park_kapasite_ar','park_kapasite_tr');  
 $crud->display_as('Aciklama_ar','Aciklama_tr');
 $crud->display_as('Ozellikler_ar','Ozellikler_tr');
 $crud->display_as('Location_ar','Location_tr');
 $crud->display_as('telefon_ar','telefon_tr');  
 $crud->display_as('adres_ar','adres_tr');  
 $crud->display_as('proje_tarih_ar','proje_tarih_tr');  
 $crud->display_as('description_ar','description_tr');  
 $crud->display_as('title_ar','title_tr');  
 $crud->display_as('proje_adi_frs','proje_adi_rus');  
 $crud->display_as('proje_yeri_frs','proje_yeri_rus');  
 $crud->display_as('min_fiyat_frs','min_fiyat_rus');  
 $crud->display_as('max_fiyat_frs','max_fiyat_russ');  
 $crud->display_as('min_m2_frs','min_m2_rus');  
 $crud->display_as('max_m2_frs','max_m2_rus');  
 $crud->display_as('proje_durum_frs','proje_durum_rus');  
 $crud->display_as('total_apartments_frs','total_apartments_rus');  
 $crud->display_as('total_land_side_frs','total_land_side_rus');  
 $crud->display_as('park_kapasite_frs','park_kapasite_rus');  
 $crud->display_as('Aciklama_frs','Aciklama_rus');  
 $crud->display_as('Ozellikler_frs','Ozellikler_rus');  
 $crud->display_as('Location_frs','Location_rus');  
 $crud->display_as('telefon_frs','telefon_rus');  
 $crud->display_as('adres_frs','adres_rus');  
 $crud->display_as('proje_tarih_frs','proje_tarih_rus');  
 $crud->display_as('description_frs','description_rus');  
 $crud->display_as('title_frs','title_rus');  

			
			
			
			
			


            $crud->field_type('favori', 'dropdown',
                array('1' => 'Favori Proje', '0' => 'Standart Proje'));

            $crud->field_type('manset', 'dropdown',
                array('1' => 'Manşet Proje', '0' => 'Standart Proje'));

            $data['side_menu'] = "Proje Ayarları";
            $data['kilavuz']   = "  <b>Proje Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }
	
	
	
 public function daire($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('projeler');
            $crud->where('kategori!=', 0);
            $crud->where('type', 'daire');			
            $crud->set_subject('Daireler');
            $crud->columns('proje_adi', 'proje_tarih', 'min_fiyat', 'min_m2', 'Fotoğraflar');

            $crud->field_type('seo_adi', 'hidden');
            $crud->set_relation('kategori', 'kategori', 'kategori_adi');
            $crud->set_relation_n_n('proje_tipleri', 'proje_tip_iliski', 'proje_tip', 'proje_id', 'proje_tip_id', 'tip_adi', 'priority');
            $crud->set_relation_n_n('unite_tipleri', 'unite_tip_iliski', 'unite_tip', 'proje_id', 'unite_tip_id', 'unite_adi', 'priority');
            $crud->set_relation_n_n('ozellik_tipleri', 'proje_ozellik_iliski', 'proje_ozellik', 'proje_id', 'proje_ozellik_id', 'ozellik_adi', 'priority');
            $crud->callback_column('Fotoğraflar', array($this, 'callback_fotolar'));
            $crud->callback_before_delete(array($this, 'proje_sil_kontrol'));
            $crud->set_field_upload('banner_1', 'assets/resimler');
            $crud->set_field_upload('banner_2', 'assets/resimler');
            $crud->set_field_upload('banner_3', 'assets/resimler');
            $crud->display_as('banner_1', 'Banner 1 286*358');
            $crud->display_as('banner_2', 'Banner 2 285*281');
            $crud->display_as('banner_3', 'Banner 3 288*349');
            $crud->display_as('banner_3', 'Banner 3 288*349');	
			
            $crud->display_as('proje_adi', 'Daire Adı');
            $crud->display_as('proje_adi_ar', 'Daire Adı Tr');			
            $crud->display_as('proje_adi_frs', 'Daire Adı Rus');			
			
            $crud->display_as('proje_tarih', 'Tarihi');				
            $crud->display_as('proje_yeri', 'Daire Yeri');
            $crud->display_as('proje_yeri_ar', 'Daire Yeri Tr');
            $crud->display_as('proje_yeri_frs', 'Daire Yeri Rus');
			
            $crud->display_as('proje_durum', 'Daire Durum');				
            $crud->display_as('sat_kir', 'Satılık mı?Kiralık mı?');
			
            $crud->display_as('min_fiyat', 'Fiyat');
            $crud->display_as('min_fiyat_ar', 'Fiyat Tr');	
			
            $crud->field_type('max_m2', 'hidden');			
            $crud->field_type('max_m2_ar', 'hidden');
            $crud->field_type('max_m2_fr', 'hidden');			
            $crud->display_as('min_m2', 'm2');				
            $crud->display_as('min_m2_ar', 'm2');	
            $crud->display_as('min_m2_fr', 'm2');			


		
	

 	            $crud->field_type('kat', 'dropdown',
                array('0' => '0','1' => '1', '2' => '2', '3' => '3'
				, '4' => '4', '5' => '5', '6' => '6', '7' => '7'
				, '8' => '8', '9' => '9', '10' => '10', '11' => '11'
				, '12' => '12', '13' => '13', '14' => '14', '15' => '15', '15+' => '15+')
				);		
 	            $crud->field_type('balkon', 'dropdown',
                array('0' => '0','1' => '1', '2' => '2', '3' => '3'));
				
            $crud->set_field_upload('dosya', 'assets/resimler');
				
      //      $crud->set_relation('proje', 'projeler', 'proje_adi');
	  
	         $this->load->model('admin_model'); 
             $data["proje_getir"]        = $this->admin_model->proje_getir();	

         if ($data["proje_getir"]): foreach ($data["proje_getir"] as $dizi):
          $pr [$dizi["proje_id"]] = $dizi["proje_adi"]; 	 
          
            endforeach;endif;
 			 $crud->field_type('proje','dropdown', $pr );	
 

   
		 
			
            $crud->callback_before_insert(array($this, 'sef_kontrol'));
            $crud->callback_before_update(array($this, 'sef_kontrol'));
            $crud->unset_clone();
            $crud->unset_back_to_list();
            $crud->unset_fields();
			
	            $crud->field_type('sat_kir', 'dropdown',
                array('1' => 'Satılık', '0' => 'Kiralık'));		
			
            $crud->field_type('type', 'hidden', 'daire');
			
            $crud->field_type('total_apartments', 'hidden');
            $crud->field_type('total_apartments_ar', 'hidden');			
            $crud->field_type('total_apartments_frs', 'hidden');			
			
            $crud->field_type('total_land_side', 'hidden');
            $crud->field_type('total_land_side_ar', 'hidden');			
            $crud->field_type('total_land_side_frs', 'hidden');

            $crud->field_type('total_land_side', 'hidden');
            $crud->field_type('total_land_side_ar', 'hidden');			
            $crud->field_type('total_land_side_frs', 'hidden');
            $crud->field_type('proje_tarih', 'hidden');			
			
			
            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","max_fiyat", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->unset_edit_fields("proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","max_fiyat", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->required_fields('proje_adi', "proje_yeri", 'kategori',  'min_fiyat',  'min_m2',  'telefon', 'Aciklama', 'banner_1'
                    , 'banner_2', 'banner_3');
            }


            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->unset_edit_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->required_fields('proje_adi', "proje_yeri_ar", 'kategori', 'proje_tarih', 'proje_tarih_ar', 'min_fiyat',  'min_m2',  'telefon', 'Aciklama', 'proje_adi_ar', 'min_fiyat_ar', 'min_m2_ar', 'telefon_ar', 'Aciklama_ar'
                    , 'banner_1', 'banner_2', 'banner_3');
            }

         if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar", "min_m2_ar","max_fiyat_frs", "max_m2_ar", "max_m2_frs","proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar");
                $crud->unset_edit_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","max_fiyat_frs", "min_m2_ar", "max_m2_ar", "max_m2_frs","proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar");
                $crud->required_fields('proje_adi', "proje_yeri_frs", 'kategori', 'proje_tarih', 'proje_tarih_frs', 'min_fiyat',  'min_m2',  'telefon', 'Aciklama', 'proje_adi_frs', 'min_fiyat_frs', 'min_m2_frs', 'max_m2_frs', 'telefon_frs', 'Aciklama_frs'
                    , 'banner_1', 'banner_2', 'banner_3');
            }


 $crud->display_as('proje_adi_ar','proje_adi_tr');  
 $crud->display_as('proje_yeri_ar','proje_yeri_tr');  
 $crud->display_as('min_fiyat_ar','min_fiyat_tr');  
 $crud->display_as('max_fiyat_ar','max_fiyat_tr');  
 $crud->display_as('min_m2_ar','min_m2_tr');  
 $crud->display_as('max_m2_ar','max_m2_tr');  
 $crud->display_as('proje_durum_ar','proje_durum_tr');  
 $crud->display_as('total_apartments_ar','total_apartments_tr');  
 $crud->display_as('total_land_side_ar','total_land_side_tr');  
 $crud->display_as('park_kapasite_ar','park_kapasite_tr');  
 $crud->display_as('Aciklama_ar','Aciklama_tr');
 $crud->display_as('Ozellikler_ar','Ozellikler_tr');
 $crud->display_as('Location_ar','Location_tr');
 $crud->display_as('telefon_ar','telefon_tr');  
 $crud->display_as('adres_ar','adres_tr');  
 $crud->display_as('proje_tarih_ar','proje_tarih_tr');  
 $crud->display_as('description_ar','description_tr');  
 $crud->display_as('title_ar','title_tr');  
 $crud->display_as('proje_adi_frs','proje_adi_rus');  
 $crud->display_as('proje_yeri_frs','proje_yeri_rus');  
 $crud->display_as('min_fiyat_frs','min_fiyat_rus');  
 $crud->display_as('max_fiyat_frs','max_fiyat_russ');  
 $crud->display_as('min_m2_frs','min_m2_rus');  
 $crud->display_as('max_m2_frs','max_m2_rus');  
 $crud->display_as('proje_durum_frs','proje_durum_rus');  
 $crud->display_as('total_apartments_frs','total_apartments_rus');  
 $crud->display_as('total_land_side_frs','total_land_side_rus');  
 $crud->display_as('park_kapasite_frs','park_kapasite_rus');  
 $crud->display_as('Aciklama_frs','Aciklama_rus');  
 $crud->display_as('Ozellikler_frs','Ozellikler_rus');  
 $crud->display_as('Location_frs','Location_rus');  
 $crud->display_as('telefon_frs','telefon_rus');  
 $crud->display_as('adres_frs','adres_rus');  
 $crud->display_as('proje_tarih_frs','proje_tarih_rus');  
 $crud->display_as('description_frs','description_rus');  
 $crud->display_as('title_frs','title_rus');  

            $crud->field_type('favori', 'dropdown',
                array('1' => 'Favori Proje', '0' => 'Standart Proje'));

            $crud->field_type('manset', 'dropdown',
                array('1' => 'Manşet Proje', '0' => 'Standart Proje'));

            $data['side_menu'] = "Daire Ayarları";
            $data['kilavuz']   = "  <b>Daire Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }	
	
	
	
	 public function villas($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('projeler');
            $crud->where('kategori!=', 0);
            $crud->where('type', 'villa');			
            $crud->set_subject('Villalar');
            $crud->columns('proje_adi', 'proje_tarih', 'min_fiyat', 'min_m2', 'Fotoğraflar');

            $crud->field_type('seo_adi', 'hidden');
            $crud->set_relation('kategori', 'kategori', 'kategori_adi');
            $crud->set_relation_n_n('proje_tipleri', 'proje_tip_iliski', 'proje_tip', 'proje_id', 'proje_tip_id', 'tip_adi', 'priority');
            $crud->set_relation_n_n('unite_tipleri', 'unite_tip_iliski', 'unite_tip', 'proje_id', 'unite_tip_id', 'unite_adi', 'priority');
            $crud->set_relation_n_n('ozellik_tipleri', 'proje_ozellik_iliski', 'proje_ozellik', 'proje_id', 'proje_ozellik_id', 'ozellik_adi', 'priority');
            $crud->callback_column('Fotoğraflar', array($this, 'callback_fotolar'));
            $crud->callback_before_delete(array($this, 'proje_sil_kontrol'));
            $crud->set_field_upload('banner_1', 'assets/resimler');
            $crud->set_field_upload('banner_2', 'assets/resimler');
            $crud->set_field_upload('banner_3', 'assets/resimler');
            $crud->display_as('banner_1', 'Banner 1 286*358');
            $crud->display_as('banner_2', 'Banner 2 285*281');
            $crud->display_as('banner_3', 'Banner 3 288*349');
            $crud->display_as('banner_3', 'Banner 3 288*349');	
			
            $crud->display_as('proje_adi', 'Villa Adı');
            $crud->display_as('proje_adi_ar', 'Villa Adı Tr');			
            $crud->display_as('proje_adi_frs', 'Villa Adı Rus');			
			
            $crud->display_as('proje_tarih', 'Tarihi');				
            $crud->display_as('proje_yeri', 'Villa Yeri');
            $crud->display_as('proje_yeri_ar', 'Villa Yeri Tr');
            $crud->display_as('proje_yeri_frs', 'Villa Yeri Rus');
			
            $crud->display_as('proje_durum', 'Villa Durum');				
            $crud->display_as('sat_kir', 'Satılık mı?Kiralık mı?');
			
            $crud->display_as('min_fiyat', 'Fiyat');
            $crud->display_as('min_fiyat_ar', 'Fiyat Tr');	
			
            $crud->field_type('max_m2', 'hidden');			
            $crud->field_type('max_m2_ar', 'hidden');
            $crud->field_type('max_m2_fr', 'hidden');			
            $crud->display_as('min_m2', 'm2');				
            $crud->display_as('min_m2_ar', 'm2');	
            $crud->display_as('min_m2_fr', 'm2');			


		
	

 	            $crud->field_type('kat', 'dropdown',
                array('0' => '0','1' => '1', '2' => '2', '3' => '3'
				, '4' => '4', '5' => '5', '6' => '6', '7' => '7'
				, '8' => '8', '9' => '9', '10' => '10', '11' => '11'
				, '12' => '12', '13' => '13', '14' => '14', '15' => '15', '15+' => '15+')
				);		
 	            $crud->field_type('balkon', 'dropdown',
                array('0' => '0','1' => '1', '2' => '2', '3' => '3'));
				
            $crud->set_field_upload('dosya', 'assets/resimler');
				
      //      $crud->set_relation('proje', 'projeler', 'proje_adi');
	  
	         $this->load->model('admin_model'); 
             $data["proje_getir"]        = $this->admin_model->proje_getir();	

         if ($data["proje_getir"]): foreach ($data["proje_getir"] as $dizi):
          $pr [$dizi["proje_id"]] = $dizi["proje_adi"]; 	 
          
            endforeach;endif;
 			 $crud->field_type('proje','dropdown', $pr );	
 

   
		 
			
            $crud->callback_before_insert(array($this, 'sef_kontrol'));
            $crud->callback_before_update(array($this, 'sef_kontrol'));
            $crud->unset_clone();
            $crud->unset_back_to_list();
            $crud->unset_fields();
			
	            $crud->field_type('sat_kir', 'dropdown',
                array('1' => 'Satılık', '0' => 'Kiralık'));		
			
            $crud->field_type('type', 'hidden', 'villa');
			
            $crud->field_type('total_apartments', 'hidden');
            $crud->field_type('total_apartments_ar', 'hidden');			
            $crud->field_type('total_apartments_frs', 'hidden');			
			
            $crud->field_type('total_land_side', 'hidden');
            $crud->field_type('total_land_side_ar', 'hidden');			
            $crud->field_type('total_land_side_frs', 'hidden');

            $crud->field_type('total_land_side', 'hidden');
            $crud->field_type('total_land_side_ar', 'hidden');			
            $crud->field_type('total_land_side_frs', 'hidden');
            $crud->field_type('proje_tarih', 'hidden');			
			
			
            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","max_fiyat", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->unset_edit_fields("proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","max_fiyat", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->required_fields('proje_adi', "proje_yeri", 'kategori',  'min_fiyat',  'min_m2',  'telefon', 'Aciklama', 'banner_1'
                    , 'banner_2', 'banner_3');
            }


            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->unset_edit_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->required_fields('proje_adi', "proje_yeri_ar", 'kategori', 'proje_tarih', 'proje_tarih_ar', 'min_fiyat',  'min_m2',  'telefon', 'Aciklama', 'proje_adi_ar', 'min_fiyat_ar', 'min_m2_ar', 'telefon_ar', 'Aciklama_ar'
                    , 'banner_1', 'banner_2', 'banner_3');
            }

         if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar", "min_m2_ar","max_fiyat_frs", "max_m2_ar", "max_m2_frs","proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar");
                $crud->unset_edit_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","max_fiyat_frs", "min_m2_ar", "max_m2_ar", "max_m2_frs","proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar");
                $crud->required_fields('proje_adi', "proje_yeri_frs", 'kategori', 'proje_tarih', 'proje_tarih_frs', 'min_fiyat',  'min_m2',  'telefon', 'Aciklama', 'proje_adi_frs', 'min_fiyat_frs', 'min_m2_frs', 'max_m2_frs', 'telefon_frs', 'Aciklama_frs'
                    , 'banner_1', 'banner_2', 'banner_3');
            }


 $crud->display_as('proje_adi_ar','proje_adi_tr');  
 $crud->display_as('proje_yeri_ar','proje_yeri_tr');  
 $crud->display_as('min_fiyat_ar','min_fiyat_tr');  
 $crud->display_as('max_fiyat_ar','max_fiyat_tr');  
 $crud->display_as('min_m2_ar','min_m2_tr');  
 $crud->display_as('max_m2_ar','max_m2_tr');  
 $crud->display_as('proje_durum_ar','proje_durum_tr');  
 $crud->display_as('total_apartments_ar','total_apartments_tr');  
 $crud->display_as('total_land_side_ar','total_land_side_tr');  
 $crud->display_as('park_kapasite_ar','park_kapasite_tr');  
 $crud->display_as('Aciklama_ar','Aciklama_tr');
 $crud->display_as('Ozellikler_ar','Ozellikler_tr');
 $crud->display_as('Location_ar','Location_tr');
 $crud->display_as('telefon_ar','telefon_tr');  
 $crud->display_as('adres_ar','adres_tr');  
 $crud->display_as('proje_tarih_ar','proje_tarih_tr');  
 $crud->display_as('description_ar','description_tr');  
 $crud->display_as('title_ar','title_tr');  
 $crud->display_as('proje_adi_frs','proje_adi_rus');  
 $crud->display_as('proje_yeri_frs','proje_yeri_rus');  
 $crud->display_as('min_fiyat_frs','min_fiyat_rus');  
 $crud->display_as('max_fiyat_frs','max_fiyat_russ');  
 $crud->display_as('min_m2_frs','min_m2_rus');  
 $crud->display_as('max_m2_frs','max_m2_rus');  
 $crud->display_as('proje_durum_frs','proje_durum_rus');  
 $crud->display_as('total_apartments_frs','total_apartments_rus');  
 $crud->display_as('total_land_side_frs','total_land_side_rus');  
 $crud->display_as('park_kapasite_frs','park_kapasite_rus');  
 $crud->display_as('Aciklama_frs','Aciklama_rus');  
 $crud->display_as('Ozellikler_frs','Ozellikler_rus');  
 $crud->display_as('Location_frs','Location_rus');  
 $crud->display_as('telefon_frs','telefon_rus');  
 $crud->display_as('adres_frs','adres_rus');  
 $crud->display_as('proje_tarih_frs','proje_tarih_rus');  
 $crud->display_as('description_frs','description_rus');  
 $crud->display_as('title_frs','title_rus');  

            $crud->field_type('favori', 'dropdown',
                array('1' => 'Favori Proje', '0' => 'Standart Proje'));

            $crud->field_type('manset', 'dropdown',
                array('1' => 'Manşet Proje', '0' => 'Standart Proje'));

            $data['side_menu'] = "Villa Ayarları";
            $data['kilavuz']   = "  <b>Villa Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }	
	
	 public function villa($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('projeler');
            $crud->where('kategori!=', 0);
            $crud->where('type', 'villa');			
            $crud->set_subject('Projeler');
            $crud->columns('proje_adi', 'proje_tarih', 'min_fiyat', 'min_m2', 'Fotoğraflar');

            $crud->field_type('seo_adi', 'hidden');
        //    $crud->set_relation('kategori', 'kategori', 'kategori_adi');
            $crud->set_relation_n_n('proje_tipleri', 'proje_tip_iliski', 'proje_tip', 'proje_id', 'proje_tip_id', 'tip_adi', 'priority');
            $crud->set_relation_n_n('unite_tipleri', 'unite_tip_iliski', 'unite_tip', 'proje_id', 'unite_tip_id', 'unite_adi', 'priority');
            $crud->set_relation_n_n('ozellik_tipleri', 'proje_ozellik_iliski', 'proje_ozellik', 'proje_id', 'proje_ozellik_id', 'ozellik_adi', 'priority');
            $crud->callback_column('Fotoğraflar', array($this, 'callback_fotolar'));
            $crud->callback_before_delete(array($this, 'proje_sil_kontrol'));
            $crud->set_field_upload('banner_1', 'assets/resimler');
            $crud->set_field_upload('banner_2', 'assets/resimler');
            $crud->set_field_upload('banner_3', 'assets/resimler');
            $crud->display_as('banner_1', 'Banner 1 286*358');
            $crud->display_as('banner_2', 'Banner 2 285*281');
            $crud->display_as('banner_3', 'Banner 3 288*349');
            $crud->display_as('banner_3', 'Banner 3 288*349');	
			
            $crud->display_as('proje_adi', 'Villa Adı');
            $crud->display_as('proje_tarih', 'Tarihi');				
            $crud->display_as('proje_yeri', 'Villa Yeri');				
            $crud->display_as('proje_durum', 'Villa Durum');		
            $crud->display_as('sat_kir', 'Satılık mı?Kiralık mı?');	
			
            $crud->display_as('min_fiyat', 'Fiyat');
            $crud->display_as('min_fiyat_ar', 'Fiyat Ar');	

            $crud->field_type('max_m2', 'hidden');				
            $crud->field_type('max_m2_ar', 'hidden');
            $crud->field_type('max_m2_fr', 'hidden');			
            $crud->display_as('min_m2', 'm2');				
            $crud->display_as('min_m2_ar', 'm2');	
            $crud->display_as('min_m2_fr', 'm2');				
			
            $crud->callback_before_insert(array($this, 'sef_kontrol'));
            $crud->callback_before_update(array($this, 'sef_kontrol'));
            $crud->unset_clone();
            $crud->unset_back_to_list();
            $crud->unset_fields();
			
	            $crud->field_type('sat_kir', 'dropdown',
                array('1' => 'Satılık', '0' => 'Kiralık'));		
			
            $crud->field_type('type', 'hidden', 'villa');
            $crud->field_type('total_land_side', 'hidden');
            $crud->field_type('total_land_side_ar', 'hidden');			
            $crud->field_type('total_land_side_frs', 'hidden');
            $crud->field_type('proje_tarih', 'hidden');	
			
 	            $crud->field_type('kat', 'dropdown',
                array('0' => '0','1' => '1', '2' => '2', '3' => '3'
				, '4' => '4', '5' => '5', '6' => '6', '7' => '7'
				, '8' => '8', '9' => '9', '10' => '10', '11' => '11'
				, '12' => '12', '13' => '13', '14' => '14', '15' => '15', '15+' => '15+')
				);		
 	            $crud->field_type('balkon', 'dropdown',
                array('0' => '0','1' => '1', '2' => '2', '3' => '3'));
				
            $crud->set_field_upload('dosya', 'assets/resimler');
				
            $crud->set_relation('proje', 'projeler', 'proje_adi');			
			
				
			
            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","max_fiyat", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->unset_edit_fields("proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","max_fiyat", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->required_fields('proje_adi', "proje_yeri", 'kategori', 'proje_tarih', 'min_fiyat',  'min_m2',  'telefon', 'Aciklama', 'banner_1'
                    , 'banner_2', 'banner_3');
            }


            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->unset_edit_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->required_fields('proje_adi', "proje_yeri_ar", 'kategori', 'proje_tarih', 'proje_tarih_ar', 'min_fiyat',  'min_m2',  'telefon', 'Aciklama', 'proje_adi_ar', 'min_fiyat_ar', 'min_m2_ar', 'max_m2_ar', 'telefon_ar', 'Aciklama_ar'
                    , 'banner_1', 'banner_2', 'banner_3');
            }

         if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar");
                $crud->unset_edit_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar");
                $crud->required_fields('proje_adi', "proje_yeri_frs", 'kategori', 'proje_tarih', 'proje_tarih_frs', 'min_fiyat',  'min_m2',  'telefon', 'Aciklama', 'proje_adi_frs', 'min_fiyat_frs', 'min_m2_frs', 'max_m2_frs', 'telefon_frs', 'Aciklama_frs'
                    , 'banner_1', 'banner_2', 'banner_3');
            }


 $crud->display_as('proje_adi_ar','proje_adi_tr');  
 $crud->display_as('proje_yeri_ar','proje_yeri_tr');  
 $crud->display_as('min_fiyat_ar','min_fiyat_tr');  
 $crud->display_as('max_fiyat_ar','max_fiyat_tr');  
 $crud->display_as('min_m2_ar','min_m2_tr');  
 $crud->display_as('max_m2_ar','max_m2_tr');  
 $crud->display_as('proje_durum_ar','proje_durum_tr');  
 $crud->display_as('total_apartments_ar','total_apartments_tr');  
 $crud->display_as('total_land_side_ar','total_land_side_tr');  
 $crud->display_as('park_kapasite_ar','park_kapasite_tr');  
 $crud->display_as('Aciklama_ar','Aciklama_tr');
 $crud->display_as('Ozellikler_ar','Ozellikler_tr');
 $crud->display_as('Location_ar','Location_tr');
 $crud->display_as('telefon_ar','telefon_tr');  
 $crud->display_as('adres_ar','adres_tr');  
 $crud->display_as('proje_tarih_ar','proje_tarih_tr');  
 $crud->display_as('description_ar','description_tr');  
 $crud->display_as('title_ar','title_tr');  
 $crud->display_as('proje_adi_frs','proje_adi_rus');  
 $crud->display_as('proje_yeri_frs','proje_yeri_rus');  
 $crud->display_as('min_fiyat_frs','min_fiyat_rus');  
 $crud->display_as('max_fiyat_frs','max_fiyat_russ');  
 $crud->display_as('min_m2_frs','min_m2_rus');  
 $crud->display_as('max_m2_frs','max_m2_rus');  
 $crud->display_as('proje_durum_frs','proje_durum_rus');  
 $crud->display_as('total_apartments_frs','total_apartments_rus');  
 $crud->display_as('total_land_side_frs','total_land_side_rus');  
 $crud->display_as('park_kapasite_frs','park_kapasite_rus');  
 $crud->display_as('Aciklama_frs','Aciklama_rus');  
 $crud->display_as('Ozellikler_frs','Ozellikler_rus');  
 $crud->display_as('Location_frs','Location_rus');  
 $crud->display_as('telefon_frs','telefon_rus');  
 $crud->display_as('adres_frs','adres_rus');  
 $crud->display_as('proje_tarih_frs','proje_tarih_rus');  
 $crud->display_as('description_frs','description_rus');  
 $crud->display_as('title_frs','title_rus');  

            $crud->field_type('favori', 'dropdown',
                array('1' => 'Favori Proje', '0' => 'Standart Proje'));

            $crud->field_type('manset', 'dropdown',
                array('1' => 'Manşet Proje', '0' => 'Standart Proje'));

            $data['side_menu'] = "Villa Ayarları";
            $data['kilavuz']   = "  <b>Villa Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }
	
 public function sl(){
	 

            $query = $this->db->query("select * from proje_resimler");
            foreach ($query->result_array() as $row) {
                $sl=unlink("assets/resimler/" . $row['foto']);
				if($sl){echo 1; continue;} echo 0;
            }
	 
	 
 }	
	
 public function arsa($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('projeler');
            $crud->where('kategori!=', 0);
            $crud->where('type', 'arsa');			
            $crud->set_subject('Arsalar');
            $crud->columns('proje_adi', 'proje_tarih', 'min_fiyat', 'min_m2', 'Fotoğraflar');

            $crud->field_type('seo_adi', 'hidden');
            $crud->set_relation('kategori', 'kategori', 'kategori_adi');
       //     $crud->set_relation_n_n('proje_tipleri', 'proje_tip_iliski', 'proje_tip', 'proje_id', 'proje_tip_id', 'tip_adi', 'priority');
       //     $crud->set_relation_n_n('unite_tipleri', 'unite_tip_iliski', 'unite_tip', 'proje_id', 'unite_tip_id', 'unite_adi', 'priority');
       //     $crud->set_relation_n_n('ozellik_tipleri', 'proje_ozellik_iliski', 'proje_ozellik', 'proje_id', 'proje_ozellik_id', 'ozellik_adi', 'priority');
            $crud->callback_column('Fotoğraflar', array($this, 'callback_fotolar'));
            $crud->callback_before_delete(array($this, 'proje_sil_kontrol'));
            $crud->set_field_upload('banner_1', 'assets/resimler');
            $crud->set_field_upload('banner_2', 'assets/resimler');
            $crud->set_field_upload('banner_3', 'assets/resimler');
            $crud->display_as('banner_1', 'Banner 1 286*358');
            $crud->display_as('banner_2', 'Banner 2 285*281');
            $crud->display_as('banner_3', 'Banner 3 288*349');
            $crud->display_as('banner_3', 'Banner 3 288*349');	
			
            $crud->display_as('min_fiyat', 'Fiyat');
            $crud->display_as('min_fiyat_ar', 'Fiyat Ar');	
	
            $crud->field_type('max_m2', 'hidden');		
            $crud->field_type('max_m2_ar', 'hidden');
            $crud->field_type('max_m2_fr', 'hidden');			
            $crud->display_as('min_m2', 'm2');				
            $crud->display_as('min_m2_ar', 'm2');	
            $crud->display_as('min_m2_fr', 'm2');	
			
	        $crud->display_as('proje_adi', 'Arsa Adı');
            $crud->display_as('proje_tarih', 'Tarihi');			
            $crud->display_as('proje_yeri', 'Arsa Yeri');				
            $crud->display_as('proje_durum', 'Arsa Durum');				
            $crud->display_as('sat_kir', 'Satılık mı?Kiralık mı?');	

            $crud->field_type('kat', 'hidden');				
            $crud->field_type('balkon', 'hidden');	
            $crud->field_type('proje', 'hidden');
            $crud->set_field_upload('dosya', 'assets/resimler');			
			
            $crud->callback_before_insert(array($this, 'sef_kontrol'));
            $crud->callback_before_update(array($this, 'sef_kontrol'));
            $crud->unset_clone();
            $crud->unset_back_to_list();
            $crud->unset_fields();
			
	            $crud->field_type('sat_kir', 'dropdown',
                array('1' => 'Satılık', '0' => 'Kiralık'));		
			
            $crud->field_type('type', 'hidden', 'arsa');
            $crud->field_type('total_land_side', 'hidden');
            $crud->field_type('total_land_side_ar', 'hidden');			
            $crud->field_type('total_land_side_frs', 'hidden');
            $crud->field_type('proje_tarih', 'hidden');	
				
			
            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","max_fiyat", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs","park_kapasite_frs","park_kapasite_ar","park_kapasite", "total_apartments","total_apartments_frs","total_apartments_ar", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->unset_edit_fields("proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","max_fiyat", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar","park_kapasite_frs","park_kapasite_ar","park_kapasite", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar","proje_adi_frs", "min_fiyat_frs", "max_fiyat_frs", "min_m2_frs","total_apartments","total_apartments_frs","total_apartments_ar", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->required_fields('proje_adi', "proje_yeri", 'kategori',  'min_fiyat',  'min_m2',  'telefon', 'Aciklama', 'banner_1'
                    , 'banner_2', 'banner_3');
            }


            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_frs", "min_fiyat_frs", "total_apartments","park_kapasite_frs","park_kapasite_ar","park_kapasite","total_apartments_frs","total_apartments_ar","max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->unset_edit_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_frs", "min_fiyat_frs","total_apartments","park_kapasite_frs","park_kapasite_ar","park_kapasite","total_apartments_frs","total_apartments_ar", "max_fiyat_frs", "min_m2_frs", "max_m2_frs", "proje_durum_frs", "total_apartments_frs"
                    , "total_land_side_frs", "park_kapasite_frs", "Aciklama_frs", "Ozellikler_frs", "Location_frs", "telefon_frs", "adres_frs", "proje_yeri_frs", 'proje_tarih_frs'
                    , "title_frs", "description_frs");
                $crud->required_fields('proje_adi', "proje_yeri_ar", 'kategori',  'proje_tarih_ar', 'min_fiyat',  'min_m2',  'telefon', 'Aciklama', 'proje_adi_ar', 'min_fiyat_ar', 'min_m2_ar', 'telefon_ar', 'Aciklama_ar'
                    , 'banner_1', 'banner_2', 'banner_3');
            }

         if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum","max_fiyat_frs","max_m2_frs", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","park_kapasite_frs","park_kapasite_ar","park_kapasite","total_apartments","total_apartments_frs","total_apartments_ar", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar");
                $crud->unset_edit_fields("proje_adi", "kategori", "whatsapp", "email","max_fiyat_ar", "proje_tarih", "min_fiyat", "max_fiyat"
                    , "min_m2", "max_m2", "proje_durum", "total_apartments", "total_land_side", "park_kapasite", "Aciklama", "Ozellikler", "Location", "telefon", "adres"
                    , "maps_linki", "proje_yeri", "seo_adi", "title", "description","proje_adi_ar", "min_fiyat_ar", "max_fiyat_ar","park_kapasite_frs","park_kapasite_ar","park_kapasite","total_apartments","total_apartments_frs","total_apartments_ar", "min_m2_ar", "max_m2_ar", "proje_durum_ar", "total_apartments_ar"
                    , "total_land_side_ar", "park_kapasite_ar", "Aciklama_ar", "Ozellikler_ar", "Location_ar", "telefon_ar", "adres_ar", "proje_yeri_ar", 'proje_tarih_ar'
                    , "title_ar", "description_ar");
                $crud->required_fields('proje_adi', "proje_yeri_frs", 'kategori', 'proje_tarih_frs', 'min_fiyat',  'min_m2',  'telefon', 'Aciklama', 'proje_adi_frs', 'min_fiyat_frs', 'min_m2_frs',  'telefon_frs', 'Aciklama_frs'
                    , 'banner_1', 'banner_2', 'banner_3');
            }

 $crud->display_as('proje_adi_ar','proje_adi_tr');  
 $crud->display_as('proje_yeri_ar','proje_yeri_tr');  
 $crud->display_as('min_fiyat_ar','min_fiyat_tr');  
 $crud->display_as('max_fiyat_ar','max_fiyat_tr');  
 $crud->display_as('min_m2_ar','min_m2_tr');  
 $crud->display_as('max_m2_ar','max_m2_tr');  
 $crud->display_as('proje_durum_ar','proje_durum_tr');  
 $crud->display_as('total_apartments_ar','total_apartments_tr');  
 $crud->display_as('total_land_side_ar','total_land_side_tr');  
 $crud->display_as('park_kapasite_ar','park_kapasite_tr');  
 $crud->display_as('Aciklama_ar','Aciklama_tr');
 $crud->display_as('Ozellikler_ar','Ozellikler_tr');
 $crud->display_as('Location_ar','Location_tr');
 $crud->display_as('telefon_ar','telefon_tr');  
 $crud->display_as('adres_ar','adres_tr');  
 $crud->display_as('proje_tarih_ar','proje_tarih_tr');  
 $crud->display_as('description_ar','description_tr');  
 $crud->display_as('title_ar','title_tr');  
 $crud->display_as('proje_adi_frs','proje_adi_rus');  
 $crud->display_as('proje_yeri_frs','proje_yeri_rus');  
 $crud->display_as('min_fiyat_frs','min_fiyat_rus');  
 $crud->display_as('max_fiyat_frs','max_fiyat_russ');  
 $crud->display_as('min_m2_frs','min_m2_rus');  
 $crud->display_as('max_m2_frs','max_m2_rus');  
 $crud->display_as('proje_durum_frs','proje_durum_rus');  
 $crud->display_as('total_apartments_frs','total_apartments_rus');  
 $crud->display_as('total_land_side_frs','total_land_side_rus');  
 $crud->display_as('park_kapasite_frs','park_kapasite_rus');  
 $crud->display_as('Aciklama_frs','Aciklama_rus');  
 $crud->display_as('Ozellikler_frs','Ozellikler_rus');  
 $crud->display_as('Location_frs','Location_rus');  
 $crud->display_as('telefon_frs','telefon_rus');  
 $crud->display_as('adres_frs','adres_rus');  
 $crud->display_as('proje_tarih_frs','proje_tarih_rus');  
 $crud->display_as('description_frs','description_rus');  
 $crud->display_as('title_frs','title_rus');  


            $crud->field_type('favori', 'dropdown',
                array('1' => 'Favori Proje', '0' => 'Standart Proje'));

            $crud->field_type('manset', 'dropdown',
                array('1' => 'Manşet Proje', '0' => 'Standart Proje'));

            $data['side_menu'] = "Arsa Ayarları";
            $data['kilavuz']   = "  <b>Arsa Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }	

    public function proje_fiyat()
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->required_fields('pr_id', 'unit_type', 'price');

            $crud->set_theme('flexigrid');
            $crud->set_table('proje_fiyat');
            $crud->set_subject('Proje Fiyatları');
            $crud->columns('pr_id', 'unit_type', 'price');
            $crud->display_as('pr_id', 'Proje');

            $crud->set_relation('pr_id', 'projeler', 'proje_adi');
            $crud->set_relation('unit_type', 'unite_tip', 'unite_adi');

            $crud->unset_clone();
            $crud->unset_back_to_list();

            // Dil Alanları

            $data['side_menu'] = "Proje Fiyat Ayarları";
            $data['kilavuz']   = "  <b>Proje Fiyat Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }

    public function proje_sil_kontrol($primary_key)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {
            $this->load->model('admin_model');
            $this->load->library('Messages');

            $this->db->where('proje_id', $primary_key);
            $this->db->delete('proje_ozellik_iliski');

            $this->db->where('proje_id', $primary_key);
            $this->db->delete('proje_tip_iliski');

            $this->db->where('proje_id', $primary_key);
            $this->db->delete('unite_tip_iliski');

            $query = $this->db->query("select * from proje_resimler Where proje_id=" . $primary_key);
            foreach ($query->result_array() as $row) {
                unlink("assets/resimler/" . $row['foto']);
            }

            $query = $this->db->query("select * from projeler Where proje_id=" . $primary_key);
            foreach ($query->result_array() as $row) {
                unlink("assets/resimler/" . $row['banner_1']);
                unlink("assets/resimler/" . $row['banner_2']);

            }

            $this->db->where('proje_id', $primary_key);
            $this->db->delete('proje_resimler');

            return true;

        }
        return false;
    }

    public function callback_fotolar($value, $row)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            return "<a class='btn btn-default' href='" . site_url('yonetim/proje_fotolar/' . $row->proje_id . '/' . $row->seo_adi) . "'>Fotoğraflar</a>";
        }

    }

    public function proje_fotolar($id, $seo_adi = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {
            $seo_adi = trim($seo_adi);
            $seo_adi = strip_tags($seo_adi);
            $seo_adi = htmlentities($seo_adi);

            if ($id == 0) {

                $this->load->library('messages');
                echo $this->messages->config('yonetim');
                return false;

            }

            if ($seo_adi == "") {

                $this->load->library('messages');
                echo $this->messages->config('yonetim');
                return false;

            }
            if ($id == "") {

                $this->load->library('messages');
                echo $this->messages->config('yonetim');
                return false;

            }

            if (!is_numeric($id)) {

                $this->load->library('messages');
                echo $this->messages->config('yonetim');
                return false;

            }

            $this->load->model('admin_model');
            $proje_kontrol = 1;
            if ($id != 0) {

                $proje_kontrol = $this->admin_model->proje_kontrol($id, $seo_adi);
            }

            if ($proje_kontrol == 0) {

                $this->load->library('messages');
                echo $this->messages->config('yonetim');
                return false;

            }
			
	

            $data['foto'] = $this->admin_model->resim_getir($id);



            $data['sayfa'] = 'Fotolar';
            $data['id']    = $id;
            $data['s_adi'] = $seo_adi;
            $this->load->view('fotolar.php', $data);

        }
    }
    
    
    
    
    
      public function foto_genel()
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {
          

            $this->load->model('admin_model');
            $id = 0;
            $data['foto'] = $this->admin_model->resim_getir_genel($id);
            
            $data['sayfa'] = 'Fotolar';
            $data['id']    = $id;
            $data['s_adi'] = "aa";
            $this->load->view('fotolar_genel.php', $data);

        }
    }
    
    
    
      public function fotolar_upload_2()
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            //db kayıt
            echo $id = $_POST["id"];
            $id      = trim($id);
            $id      = strip_tags($id);
            $id      = htmlentities($id);


            $this->load->model('admin_model');


            $allowed = array('png', 'jpg', 'jpeg');

            if (isset($_FILES['upl']) && $_FILES['upl']['error'] == 0) {

                $extension = pathinfo($_FILES['upl']['name'], PATHINFO_EXTENSION);

                $random = rand(111111111, 999999999);
                $dt     = date("d-m-Y H:i:s");
                $name   = md5($random . "" . $dt);
                $name   = $name . "." . $extension;

                if (!in_array(strtolower($extension), $allowed)) {
                    echo '{"status":"error"}';
                    exit;
                }

                if (move_uploaded_file($_FILES['upl']['tmp_name'], 'assets/resim_url/' . $name)) {

                    $resim_kaydet = $this->admin_model->resim_kaydet($id, $name);
                    if ($resim_kaydet == 1) {

                        echo '{"status":"success"}';
                        exit;

                    }

                    exit;
                }
            }

            echo '{"status":"error"}';
            exit;

        }
    }
    
    
    
     public function foto_sil_2($id,$foto_adi)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $this->load->model('admin_model');

            $resim_sil = $this->admin_model->resim_sil_genel($id,$foto_adi);
            
            
     
           
            if ($resim_sil == 1) {

                $this->load->library('messages');
                echo $this->messages->True_Delete('yonetim/foto_genel');

            } else {

                $this->load->library('messages');
                echo $this->messages->False_Delete('yonetim/foto_genel');

            }

        }

    }
    
    
    
    
    
    
    
    
    
    
    

    public function robot()
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {
            $dosya          = fopen('robots.txt', 'r');
            $data['icerik'] = fread($dosya, filesize('robots.txt'));
            fclose($dosya);
            $data['sayfa'] = 'Robot';
            $this->load->view('robot.php', $data);

        }
    }

    public function robot_al()
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $rb    = $_POST["rb"];
            $dosya = fopen('robots.txt', 'w');
            fwrite($dosya, $rb);
            fclose($dosya);

            $this->load->library('Messages');
            echo $this->messages->config('yonetim/robot');
            return false;

        }
    }

    public function fotolar_upload()
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            //db kayıt
            echo $id = $_POST["id"];
            $id      = trim($id);
            $id      = strip_tags($id);
            $id      = htmlentities($id);

            $adi = $_POST["adi"];
            $adi = trim($adi);
            $adi = strip_tags($adi);
            $adi = htmlentities($adi);

            $this->load->model('admin_model');

            $proje_kontrol = 1;
            if ($id != 0) {
                $proje_kontrol = $this->admin_model->proje_kontrol($id, $adi);
            }

            if ($proje_kontrol == 0) {

                echo '{"status":"error"}';
                exit;
            }

            $allowed = array('png', 'jpg', 'jpeg');

            if (isset($_FILES['upl']) && $_FILES['upl']['error'] == 0) {

                $extension = pathinfo($_FILES['upl']['name'], PATHINFO_EXTENSION);

                $random = rand(111111111, 999999999);
                $dt     = date("d-m-Y H:i:s");
                $name   = md5($random . "" . $dt);
                $name   = $name . "." . $extension;

                if (!in_array(strtolower($extension), $allowed)) {
                    echo '{"status":"error"}';
                    exit;
                }

                if (move_uploaded_file($_FILES['upl']['tmp_name'], 'assets/resimler/' . $name)) {

                    $resim_kaydet = $this->admin_model->resim_kaydet($id, $name);
                    if ($resim_kaydet == 1) {

                        echo '{"status":"success"}';
                        exit;

                    }

                    exit;
                }
            }

            echo '{"status":"error"}';
            exit;

        }
    }

    public function foto_sil($id, $seo_adi, $foto_id, $pr_id, $foto_adi)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $this->load->model('admin_model');

            $resim_sil = $this->admin_model->resim_sil($foto_id, $pr_id, $foto_adi);
            if ($resim_sil == 1) {

                $this->load->library('messages');
                echo $this->messages->True_Delete('yonetim/proje_fotolar/' . $id . '/' . $seo_adi);

            } else {

                $this->load->library('messages');
                echo $this->messages->False_Delete('yonetim/proje_fotolar/' . $id . '/' . $seo_adi);

            }

        }

    }

    public function haber($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('haber');

            $crud->set_subject('Haberler');
            $crud->columns('baslik', 'tarih', 'kategori_id');

            $crud->field_type('seo_adi', 'hidden');

            $crud->display_as('kategori_id', 'Haber Kategorisi');
            $crud->set_relation('kategori_id', 'haber_kategori', 'kategori_adi');

            $crud->callback_before_insert(array($this, 'sef_kontrol_2'));
            $crud->callback_before_update(array($this, 'sef_kontrol_2'));
            $crud->callback_before_delete(array($this, 'haber_sil_kontrol'));

            $crud->set_field_upload('resim', 'assets/resimler');
            $crud->set_field_upload('banner_1', 'assets/resimler');
            $crud->set_field_upload('banner_2', 'assets/resimler');
            $crud->display_as('resim', 'Resim 1234*490');
            $crud->display_as('banner_1', 'Banner 1 287*180');
            $crud->display_as('banner_2', 'Banner 2 602*490');

            $crud->unset_clone();
            $crud->unset_back_to_list();

            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("baslik_ar", "icerik_ar", "haber_tarih_ar", "title_ar","tarih_ar", "description_ar","baslik_frs", "icerik_frs", "haber_tarih_frs", "title_frs","tarih_frs", "description_frs");
                $crud->unset_edit_fields("baslik_ar", "icerik_ar", "haber_tarih_ar", "title_ar","tarih_ar", "description_ar","baslik_frs", "icerik_frs", "haber_tarih_frs", "title_frs","tarih_frs", "description_frs");
                $crud->required_fields('baslik', 'icerik');
            }
            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("baslik", "icerik", "kategori_id", 'seo_adi', "title","tarih", "description","baslik_frs", "icerik_frs", "haber_tarih_frs", "title_frs","tarih_frs", "description_frs");
                $crud->unset_edit_fields("baslik", "icerik", "kategori_id", 'seo_adi', "title","tarih",  "description","baslik_frs", "icerik_frs", "haber_tarih_frs", "title_frs","tarih_frs", "description_frs");
                $crud->required_fields( 'baslik_ar', 'icerik_ar');
            }
   if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("baslik", "icerik", "kategori_id", 'seo_adi', "title","tarih", "description","baslik_ar", "icerik_ar", "haber_tarih_ar", "title_ar","tarih_ar", "description_ar");
                $crud->unset_edit_fields("baslik", "icerik", "kategori_id", 'seo_adi', "title","tarih",  "description","baslik_ar", "icerik_ar", "haber_tarih_ar", "title_ar","tarih_ar", "description_ar");
                $crud->required_fields( 'baslik_frs', 'icerik_frs');
            }

$crud->display_as('tarih_ar','tarih_tr');
$crud->display_as('baslik_ar','baslik_tr');
$crud->display_as('icerik_ar','icerik_tr');
$crud->display_as('description_ar','description_tr');
$crud->display_as('title_ar','title_tr');
$crud->display_as('tarih_frs','tarih_rus');
$crud->display_as('baslik_frs','baslik_rus');
$crud->display_as('icerik_frs','icerik_rus');
$crud->display_as('description_frs','description_rus');
$crud->display_as('title_frs','title_rus');  



            $crud->field_type('manset', 'dropdown',
                array('1' => 'Aktif', '0' => 'Pasif'));
             $crud->field_type('haber_sayfa_manset', 'dropdown',
                array('1' => 'Aktif', '0' => 'Pasif'));
             $crud->field_type('haber_sayfa_manset_buyuk', 'dropdown',
                array('1' => 'Aktif', '0' => 'Pasif')); 
				
            $data['side_menu'] = "Haber Ayarları";
            $data['kilavuz']   = "  <b>Haber Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }

    public function buyer($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('haber');
            $crud->where('kategori_id', 0);
            $crud->set_subject('Buyer Guide');
            $crud->columns('baslik', 'tarih');

            $crud->field_type('seo_adi', 'hidden');

            $crud->field_type('kategori_id', 'hidden', 0);
            $crud->callback_before_insert(array($this, 'sef_kontrol_2'));
            $crud->callback_before_update(array($this, 'sef_kontrol_2'));

            $crud->set_field_upload('resim', 'assets/resimler');
            $crud->set_field_upload('banner_1', 'assets/resimler');
            $crud->set_field_upload('banner_2', 'assets/resimler');
            $crud->display_as('resim', 'Resim 1234*490');
            $crud->display_as('banner_1', 'Banner 1 287*180');
            $crud->display_as('banner_2', 'Banner 2 602*490');

            $crud->callback_before_delete(array($this, 'haber_sil_kontrol'));
            $crud->unset_clone();
            $crud->unset_back_to_list();

            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("baslik_ar", "icerik_ar", "haber_tarih_ar", "title_ar","tarih_ar", "description_ar","baslik_frs", "icerik_frs", "haber_tarih_frs", "title_frs","tarih_frs", "description_frs");
                $crud->unset_edit_fields("baslik_ar", "icerik_ar", "haber_tarih_ar", "title_ar","tarih_ar", "description_ar","baslik_frs", "icerik_frs", "haber_tarih_frs", "title_frs","tarih_frs", "description_frs");
                $crud->required_fields('baslik', 'icerik');
            }
            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("baslik", "icerik", "title","tarih",  "description","baslik_frs", "icerik_frs", "haber_tarih_frs", "title_frs","tarih_frs", "description_frs");
                $crud->unset_edit_fields("baslik", "icerik", "title", "tarih", "description","baslik_frs", "icerik_frs", "haber_tarih_frs", "title_frs","tarih_frs", "description_frs");
                $crud->required_fields('baslik', 'icerik', 'baslik_ar', 'icerik_ar');
            }
  if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("baslik", "icerik", "title","tarih",  "description","baslik_ar", "icerik_ar", "haber_tarih_ar", "title_ar","tarih_ar", "description_ar");
                $crud->unset_edit_fields("baslik", "icerik", "title", "tarih", "description","baslik_ar", "icerik_ar", "haber_tarih_ar", "title_ar","tarih_ar", "description_ar");
                $crud->required_fields('baslik', 'icerik', 'baslik_frs', 'icerik_frs');
            }
            $data['side_menu'] = "Buyer Guide Ayarları";
            $data['kilavuz']   = "  <b>Buyer Guide Ayarları</b>";
            $output            = $crud->render();
            $output->data      = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }

    public function haber_sil_kontrol($primary_key)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $query = $this->db->query("select * from haber Where haber_id=" . $primary_key);
            foreach ($query->result_array() as $row) {
                unlink("assets/resimler/" . $row['resim']);
                unlink("assets/resimler/" . $row['banner_1']);
                unlink("assets/resimler/" . $row['banner_2']);
            }
            return true;

        }
        return false;
    }

    public function hakkimizda($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            if ($state == 'edit') {
                $primary_key = $state_info->primary_key;

                if ($primary_key != 1) {

                    $this->load->library('messages');
                    echo $this->messages->config('yonetim');
                    return false;

                }

            }

            $crud->set_theme('flexigrid');
            $crud->set_table('hakkimizda');
            $crud->set_subject('Hakkımızda');
            $crud->columns('baslik');

            $crud->set_field_upload('resim', 'assets/resimler');
            $crud->display_as('resim', 'Resim 1234*490');

            $crud->unset_clone();
            $crud->unset_back_to_list();

            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("baslik_ar", "yazi_ar", "misyon_ar", "vizyon_ar", "alan_1_baslik_ar", "alan_1_yazi_ar", "alan_2_baslik_ar", "alan_2_yazi_ar", "alan_3_baslik_ar", "alan_3_yazi_ar"
                    , "alan_4_baslik_ar", "alan_4_yazi_ar", "alan_5_baslik_ar", "alan_5_yazi_ar", "about_description_ar", "about_title_ar","baslik_frs", "yazi_frs", "misyon_frs", "vizyon_frs", "alan_1_baslik_frs", "alan_1_yazi_frs", "alan_2_baslik_frs", "alan_2_yazi_frs", "alan_3_baslik_frs", "alan_3_yazi_frs"
                    , "alan_4_baslik_frs", "alan_4_yazi_frs", "alan_5_baslik_frs", "alan_5_yazi_frs", "about_description_frs", "about_title_frs");
                $crud->unset_edit_fields("baslik_ar", "yazi_ar", "misyon_ar", "vizyon_ar", "alan_1_baslik_ar", "alan_1_yazi_ar", "alan_2_baslik_ar", "alan_2_yazi_ar", "alan_3_baslik_ar", "alan_3_yazi_ar"
                    , "alan_4_baslik_ar", "alan_4_yazi_ar", "alan_5_baslik_ar", "alan_5_yazi_ar", "about_description_ar", "about_title_ar","baslik_frs", "yazi_frs", "misyon_frs", "vizyon_frs", "alan_1_baslik_frs", "alan_1_yazi_frs", "alan_2_baslik_frs", "alan_2_yazi_frs", "alan_3_baslik_frs", "alan_3_yazi_frs"
                    , "alan_4_baslik_frs", "alan_4_yazi_frs", "alan_5_baslik_frs", "alan_5_yazi_frs", "about_description_frs", "about_title_frs");
                $crud->required_fields('baslik', 'yazi', 'resim');
            }
            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("baslik", "yazi", "misyon", "vizyon", "alan_1_baslik", "alan_1_yazi", "alan_2_baslik", "alan_2_yazi", "alan_3_baslik", "alan_3_yazi", "alan_4_baslik", "alan_4_yazi", "alan_5_baslik", "alan_5_yazi", "about_description", "about_title","baslik_frs", "yazi_frs", "misyon_frs", "vizyon_frs", "alan_1_baslik_frs", "alan_1_yazi_frs", "alan_2_baslik_frs", "alan_2_yazi_frs", "alan_3_baslik_frs", "alan_3_yazi_frs"
                    , "alan_4_baslik_frs", "alan_4_yazi_frs", "alan_5_baslik_frs", "alan_5_yazi_frs", "about_description_frs", "about_title_frs");
                $crud->unset_edit_fields("baslik", "yazi", "misyon", "vizyon", "alan_1_baslik", "alan_1_yazi", "alan_2_baslik", "alan_2_yazi", "alan_3_baslik", "alan_3_yazi", "alan_4_baslik", "alan_4_yazi", "alan_5_baslik", "alan_5_yazi", "about_description", "about_title","baslik_frs", "yazi_frs", "misyon_frs", "vizyon_frs", "alan_1_baslik_frs", "alan_1_yazi_frs", "alan_2_baslik_frs", "alan_2_yazi_frs", "alan_3_baslik_frs", "alan_3_yazi_frs"
                    , "alan_4_baslik_frs", "alan_4_yazi_frs", "alan_5_baslik_frs", "alan_5_yazi_frs", "about_description_frs", "about_title_frs");
                $crud->required_fields('baslik', 'yazi', 'resim', 'baslik_ar', 'yazi_ar');
            }


  if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("baslik", "yazi", "misyon", "vizyon", "alan_1_baslik", "alan_1_yazi", "alan_2_baslik", "alan_2_yazi", "alan_3_baslik", "alan_3_yazi", "alan_4_baslik", "alan_4_yazi", "alan_5_baslik", "alan_5_yazi", "about_description", "about_title","baslik_ar", "yazi_ar", "misyon_ar", "vizyon_ar", "alan_1_baslik_ar", "alan_1_yazi_ar", "alan_2_baslik_ar", "alan_2_yazi_ar", "alan_3_baslik_ar", "alan_3_yazi_ar"
                    , "alan_4_baslik_ar", "alan_4_yazi_ar", "alan_5_baslik_ar", "alan_5_yazi_ar", "about_description_ar", "about_title_ar");
                $crud->unset_edit_fields("baslik", "yazi", "misyon", "vizyon", "alan_1_baslik", "alan_1_yazi", "alan_2_baslik", "alan_2_yazi", "alan_3_baslik", "alan_3_yazi", "alan_4_baslik", "alan_4_yazi", "alan_5_baslik", "alan_5_yazi", "about_description", "about_title","baslik_ar", "yazi_ar", "misyon_ar", "vizyon_ar", "alan_1_baslik_ar", "alan_1_yazi_ar", "alan_2_baslik_ar", "alan_2_yazi_ar", "alan_3_baslik_ar", "alan_3_yazi_ar"
                    , "alan_4_baslik_ar", "alan_4_yazi_ar", "alan_5_baslik_ar", "alan_5_yazi_ar", "about_description_ar", "about_title_ar");
                $crud->required_fields('baslik', 'yazi', 'resim', 'baslik_frs', 'yazi_frs');
            }

$crud->display_as('baslik_ar','baslik_tr');
$crud->display_as('yazi_ar','yazi_tr');
$crud->display_as('misyon_ar','misyon_tr');
$crud->display_as('vizyon_ar','vizyon_tr');
$crud->display_as('alan_1_baslik_ar','alan_1_baslik_tr');
$crud->display_as('alan_1_yazi_ar','alan_1_yazi_tr');
$crud->display_as('alan_2_baslik_ar','alan_2_baslik_tr');
$crud->display_as('alan_2_yazi_ar','alan_2_yazi_tr');
$crud->display_as('alan_3_baslik_ar','alan_3_baslik_tr');
$crud->display_as('alan_3_yazi_ar','alan_3_yazi_tr');
$crud->display_as('alan_4_baslik_ar','alan_4_baslik_tr');
$crud->display_as('alan_4_yazi_ar','alan_4_yazi_tr');
$crud->display_as('alan_5_baslik_ar','alan_5_baslik_tr');
$crud->display_as('alan_5_yazi_ar','alan_5_yazi_tr');
$crud->display_as('about_description_ar','about_description_tr');
$crud->display_as('about_title_ar','about_title_tr');
$crud->display_as('baslik_frs','baslik_rus');
$crud->display_as('yazi_frs','yazi_rus');
$crud->display_as('misyon_frs','misyon_rus');
$crud->display_as('vizyon_frs','vizyon_rus');
$crud->display_as('alan_1_baslik_frs','alan_1_baslik_rus');
$crud->display_as('alan_1_yazi_frs','alan_1_yazi_rus');
$crud->display_as('alan_2_baslik_frs','alan_2_baslik_rus');
$crud->display_as('alan_2_yazi_frs','alan_2_yazi_rus');
$crud->display_as('alan_3_baslik_frs','alan_3_baslik_rus');
$crud->display_as('alan_3_yazi_frs','alan_3_yazi_rus');
$crud->display_as('alan_4_baslik_frs','alan_4_baslik_rus');
$crud->display_as('alan_4_yazi_frs','alan_4_yazi_rus');
$crud->display_as('alan_5_baslik_frs','alan_5_baslik_rus');
$crud->display_as('alan_5_yazi_frs','alan_5_yazi_rus');
$crud->display_as('about_description_frs','about_description_rus');
$crud->display_as('about_title_frs','about_title_rus');  



            $data['side_menu'] = "Hakkımızda Ayarları";
            $data['kilavuz']   = "  <b>Hakkımızda Ayarları</b>";
            $crud->unset_delete();
            $crud->unset_add();
            $output       = $crud->render();
            $output->data = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }

    public function servis($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            if ($state == 'edit') {
                $primary_key = $state_info->primary_key;

                if ($primary_key != 3) {

                    $this->load->library('messages');
                    echo $this->messages->config('yonetim');
                    return false;

                }

            }

            $crud->set_theme('flexigrid');
            $crud->set_table('servis');
            $crud->set_subject('Servis');
            $crud->columns('alan_1_baslik');

            $crud->unset_clone();
            $crud->unset_back_to_list();
			
            $crud->set_field_upload('resim_1', 'assets/resimler');
            $crud->set_field_upload('resim_2', 'assets/resimler');
            $crud->set_field_upload('resim_3', 'assets/resimler');			
            $crud->set_field_upload('resim_4', 'assets/resimler');

            $crud->display_as('resim_1', 'resim_1 49*49');		
            $crud->display_as('resim_2', 'resim_1 49*49');		
            $crud->display_as('resim_3', 'resim_1 49*49');		
            $crud->display_as('resim_4', 'resim_1 49*49');		
			
            // Dil Alanları

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("alan_1_baslik_ar", "alan_1_yazi_ar", "alan_2_baslik_ar", "alan_2_yazi_ar", "alan_3_baslik_ar", "alan_3_yazi_ar"
                    , "alan_4_baslik_ar", "alan_4_yazi_ar","alan_1_baslik_frs", "alan_1_yazi_frs", "alan_2_baslik_frs", "alan_2_yazi_frs", "alan_3_baslik_frs", "alan_3_yazi_frs"
                    , "alan_4_baslik_frs", "alan_4_yazi_frs");
                $crud->unset_edit_fields("alan_1_baslik_ar", "alan_1_yazi_ar", "alan_2_baslik_ar", "alan_2_yazi_ar", "alan_3_baslik_ar", "alan_3_yazi_ar"
                    , "alan_4_baslik_ar", "alan_4_yazi_ar","alan_1_baslik_frs", "alan_1_yazi_frs", "alan_2_baslik_frs", "alan_2_yazi_frs", "alan_3_baslik_frs", "alan_3_yazi_frs"
                    , "alan_4_baslik_frs", "alan_4_yazi_frs");
                $crud->required_fields('alan_1_baslik', 'alan_2_baslik', 'alan_3_baslik', 'alan_4_baslik');
            }
            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("alan_1_baslik", "alan_1_yazi", "alan_2_baslik", "alan_2_yazi", "alan_3_baslik", "alan_3_yazi"
                    , "alan_4_baslik", "alan_4_yazi","alan_1_baslik_frs", "alan_1_yazi_frs", "alan_2_baslik_frs", "alan_2_yazi_frs", "alan_3_baslik_frs", "alan_3_yazi_frs"
                    , "alan_4_baslik_frs", "alan_4_yazi_frs");
                $crud->unset_edit_fields("alan_1_baslik", "alan_1_yazi", "alan_2_baslik", "alan_2_yazi", "alan_3_baslik", "alan_3_yazi"
                    , "alan_4_baslik", "alan_4_yazi","alan_1_baslik_frs", "alan_1_yazi_frs", "alan_2_baslik_frs", "alan_2_yazi_frs", "alan_3_baslik_frs", "alan_3_yazi_frs"
                    , "alan_4_baslik_frs", "alan_4_yazi_frs");
                $crud->required_fields('alan_1_baslik_ar', 'alan_2_baslik_ar', 'alan_3_baslik_ar', 'alan_4_baslik_ar');
            }




       if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("alan_1_baslik", "alan_1_yazi", "alan_2_baslik", "alan_2_yazi", "alan_3_baslik", "alan_3_yazi"
                    , "alan_4_baslik", "alan_4_yazi","alan_1_baslik_ar", "alan_1_yazi_ar", "alan_2_baslik_ar", "alan_2_yazi_ar", "alan_3_baslik_ar", "alan_3_yazi_ar"
                    , "alan_4_baslik_ar", "alan_4_yazi_ar");
                $crud->unset_edit_fields("alan_1_baslik", "alan_1_yazi", "alan_2_baslik", "alan_2_yazi", "alan_3_baslik", "alan_3_yazi"
                    , "alan_4_baslik", "alan_4_yazi","alan_1_baslik_ar", "alan_1_yazi_ar", "alan_2_baslik_ar", "alan_2_yazi_ar", "alan_3_baslik_ar", "alan_3_yazi_ar"
                    , "alan_4_baslik_ar", "alan_4_yazi_ar");
                $crud->required_fields('alan_1_baslik_ar', 'alan_2_baslik_frs', 'alan_3_baslik_frs', 'alan_4_baslik_frs');
            }





$crud->display_as('alan_1_baslik_ar','alan_1_baslik_tr');
$crud->display_as('alan_1_yazi_ar','alan_1_yazi_tr');
$crud->display_as('alan_2_baslik_ar','alan_2_baslik_tr');
$crud->display_as('alan_2_yazi_ar','alan_2_yazi_tr');
$crud->display_as('alan_3_baslik_ar','alan_3_baslik_tr');
$crud->display_as('alan_3_yazi_ar','alan_3_yazi_tr');
$crud->display_as('alan_4_baslik_ar','alan_4_baslik_tr');
$crud->display_as('alan_4_yazi_ar','alan_4_yazi_tr');
$crud->display_as('alan_1_baslik_frs','alan_1_baslik_rus');
$crud->display_as('alan_1_yazi_frs','alan_1_yazi_rus');
$crud->display_as('alan_2_baslik_frs','alan_2_baslik_rus');
$crud->display_as('alan_2_yazi_frs','alan_2_yazi_rus');
$crud->display_as('alan_3_baslik_frs','alan_3_baslik_rus');
$crud->display_as('alan_3_yazi_frs','alan_3_yazi_rus');
$crud->display_as('alan_4_baslik_frs','alan_4_baslik_rus');
$crud->display_as('alan_4_yazi_frs','alan_4_yazi_rus');








            $data['side_menu'] = "Servis Ayarları";
            $data['kilavuz']   = "  <b>Servis Ayarları</b>";
            $crud->unset_delete();
            $crud->unset_add();
            $output       = $crud->render();
            $output->data = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }

    public function yorum($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('yorum');

            $crud->set_subject('Yorumlar');
            $crud->columns('kim', 'yer', 'tur');

            $crud->set_field_upload('resim', 'assets/resimler');
            $crud->display_as('resim', 'Resim 1250*500');
            $crud->callback_before_delete(array($this, 'yorum_sil_kontrol'));
            $crud->field_type('durum', 'dropdown',
                array('1' => 'Aktif', '0' => 'Pasif'));
             $crud->field_type('tur', 'dropdown',
                array('1' => 'Yorum', '0' => 'Mesaj'));               
            $crud->unset_clone();
            $crud->unset_back_to_list();
            $data['side_menu'] = "Buyer Guide Ayarları";
            $data['kilavuz']   = "  <b>Buyer Guide Ayarları</b>";

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("kim_ar", "yer_ar", "yazi_ar","kim_frs", "yer_frs", "yazi_frs");
                $crud->unset_edit_fields("kim_ar", "yer_ar", "yazi_ar","kim_frs", "yer_frs", "yazi_frs");
                $crud->required_fields('kim', 'yer', 'yazi', 'resim');
            }
            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("kim", "yer", "yazi","kim_frs", "yer_frs", "yazi_frs");
                $crud->unset_edit_fields("kim", "yer", "yazi","kim_frs", "yer_frs", "yazi_frs");
                $crud->required_fields('kim', 'yer', 'yazi', 'resim', "kim_ar", "yer_ar", "yazi_ar");
            }
              if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("kim", "yer", "yazi","kim_ar", "yer_ar", "yazi_ar");
                $crud->unset_edit_fields("kim", "yer", "yazi","kim_ar", "yer_ar", "yazi_ar");
                $crud->required_fields('kim', 'yer', 'yazi', 'resim', "kim_frs", "yer_frs", "yazi_frs");
            }

            $output       = $crud->render();
            $output->data = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }
    
    
      public function mesaj($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('yorum');
            $crud->where('tur', 0);
            $crud->set_subject('Mesajlar');
            $crud->columns('kim', 'yer');
            $crud->field_type('tur', 'hidden', 0);
            $crud->set_field_upload('resim', 'assets/resimler');
            $crud->display_as('resim', 'Resim 1250*500');
            $crud->callback_before_delete(array($this, 'yorum_sil_kontrol'));
            $crud->field_type('durum', 'dropdown',
                array('1' => 'Aktif', '0' => 'Pasif'));
            $crud->unset_clone();
            $crud->unset_back_to_list();
            $data['side_menu'] = "Buyer Guide Ayarları";
            $data['kilavuz']   = "  <b>Buyer Guide Ayarları</b>";

            if ($this->session->userdata('ln') == "en") {
                $crud->unset_add_fields("kim_ar", "yer_ar", "yazi_ar","kim_frs", "yer_frs", "yazi_frs");
                $crud->unset_edit_fields("kim_ar", "yer_ar", "yazi_ar","kim_frs", "yer_frs", "yazi_frs");
                $crud->required_fields('kim', 'yer', 'yazi', 'resim');
            }
            if ($this->session->userdata('ln') == "ar") {
                $crud->unset_add_fields("kim", "yer", "yazi","kim_frs", "yer_frs", "yazi_frs");
                $crud->unset_edit_fields("kim", "yer", "yazi","kim_frs", "yer_frs", "yazi_frs");
                $crud->required_fields('kim', 'yer', 'yazi', 'resim', "kim_ar", "yer_ar", "yazi_ar");
            }

              if ($this->session->userdata('ln') == "frs") {
                $crud->unset_add_fields("kim", "yer", "yazi","kim_ar", "yer_ar", "yazi_ar");
                $crud->unset_edit_fields("kim", "yer", "yazi","kim_ar", "yer_ar", "yazi_ar");
                $crud->required_fields('kim', 'yer', 'yazi', 'resim', "kim_frs", "yer_frs", "yazi_frs");
            }

            $output       = $crud->render();
            $output->data = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }

    public function link($edit = null, $id = null)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $crud       = new grocery_CRUD();
            $state      = $crud->getState();
            $state_info = $crud->getStateInfo();

            $crud->set_theme('flexigrid');
            $crud->set_table('link');
            $crud->set_subject('Linkler');
            $crud->columns('adi');

            $crud->unset_clone();
            $crud->unset_back_to_list();
            $data['side_menu'] = "Link Ayarları";
            $data['kilavuz']   = "  <b>Link Ayarları</b>";

            $crud->required_fields('adi', 'adi_ar', 'adi_frs', 'link');
			
            $crud->display_as('link_ar', 'link_tr');			
            $crud->display_as('adi_ar', 'adi_tr');				
            $crud->display_as('link_frs', 'link_rus');				
            $crud->display_as('adi_frs', 'adi_rus');	
			
			
            $output       = $crud->render();
            $output->data = $data;
            //  $this->_example_output($output);
            $this->load->view('index', (array) $output);

        }
    }

    public function yorum_sil_kontrol($primary_key)
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            $query = $this->db->query("select * from yorum Where yorum_id=" . $primary_key);
            foreach ($query->result_array() as $row) {
                unlink("assets/resimler/" . $row['resim']);
            }
            return true;

        }
        return false;
    }

    public function lng($ln = "")
    {

        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            if ($ln == "") {

                $ln = "en";
            }
            if (($ln != "en") and ($ln != "ar")and ($ln != "frs")) {
                $ln = "en";
            }

            $this->session->set_userdata('ln', $ln);

            $parcala = explode(base_url(), $_SERVER['HTTP_REFERER']);
            $this->load->library('messages');
            $this->messages->config($parcala[1]);
            return false;

        }

    }

    public function ss()
    {

        ?>
<html>

<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Property TR">
  <title>Property TR</title>
    <style type="text/css">
        body{
            direction:rtl;
            text-align: right;
        }


        #textareas{
            direction:rtl
        }
    </style>
</head>

<body>


<?php
/*
        $query =$this->db->query("select * from projeler Where proje_id=5");
        foreach ($query->result_array() as $row)
        {
        echo $row['Aciklama'];
        }
         */

        $servername = "localhost";
        $database   = "prop";
        $username   = "root";
        $password   = "";
// Create connection
        $conn = mysqli_connect($servername, $username, $password, $database);
        mysqli_query($conn, "SET NAMES 'utf8';");

// Check connection
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }
        echo "Connected successfully";

        echo '';
        $sql = "select * from projeler Where proje_id=5";
//$sql="select * from deneme Where id=1";
        $sorgu = mysqli_query($conn, $sql);
        while ($sonuc = mysqli_fetch_row($sorgu)) {
            echo $sonuc[32]; // ogrID kolonu
        }

        ?>

</body>

</html>

<?php

    }

    public function mail()
    {
        /*
        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {
         */   
            
            $nm  = $_POST["nm"];
            $em  = $_POST["em"];
            $ph  = $_POST["ph"];
            $msg = $_POST["msg"];
            echo $ulke =$_POST["ulke"];

            $nm  = trim($nm);
            $nm  = strip_tags($nm);
            $nm  = htmlentities($nm);
            $em  = trim($em);
            $em  = strip_tags($em);
            $em  = htmlentities($em);
            $ph  = trim($ph);
            $ph  = strip_tags($ph);
            $ph  = htmlentities($ph);
            $msg = trim($msg);
            $msg = strip_tags($msg);
            $msg = htmlentities($msg);
            $ulke = trim($ulke);
            $ulke = strip_tags($ulke);
            $ulke = htmlentities($ulke);
            
            

            if (($msg == "") or ($msg == "undefined")) {$msg = "";}

            $this->load->library('mail/eposta');
            $mail = $this->eposta->bilgi($nm, $em, $ph, $msg, $ulke);
            echo "Başarılı";
            /*
        }
*/
    }

    public function eti_kyt()
    {
        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {
            $alt = $_POST["alt"];

            $title = $_POST["title"];
            $id    = $_POST["id"];

            $alt   = trim($alt);
            $alt   = strip_tags($alt);
            $alt   = htmlentities($alt);
            $title = trim($title);
            $title = strip_tags($title);
            $title = htmlentities($title);

            $this->load->model('admin_model');
            $this->admin_model->alt_gunc($alt, $title, $id);
            echo "BAŞARILI";

        }
    }

    public function generator()
    {
        $online = $this->session->userdata('adminonline');
        if ($this->login_kontrol($online) == true) {

            ini_set("display_errors", "1");
            error_reporting(E_ALL);
            include "SitemapGenerator.php";

            $generator = new \Icamys\SitemapGenerator\SitemapGenerator('');

// will create also compressed (gzipped) sitemap
            $generator->createGZipFile = true;

// determine how many urls should be put into one file
            // according to standard protocol 50000 is maximum value (see http://www.sitemaps.org/protocol.html)
            $generator->maxURLsPerSitemap = 50000;

// sitemap file name
            $generator->sitemapFileName = "sitemap.xml";

// sitemap index file name
            $generator->sitemapIndexFileName = "sitemap-index.xml";

// alternate languages
            $alternates = [
                //  ['hreflang' => 'de', 'href' => "http://www.example.com/de"],
                //    ['hreflang' => 'fr', 'href' => "http://www.example.com/fr"],
            ];

// adding url `loc`, `lastmodified`, `changefreq`, `priority`, `alternates`
            $generator->addUrl('propertytr.com', new DateTime(), 'always', '0.5', $alternates);
            $generator->addUrl('propertytr.com/ar', new DateTime(), 'always', '0.5', $alternates);
            $generator->addUrl('propertytr.com/contact', new DateTime(), 'always', '0.5', $alternates);
            $generator->addUrl('propertytr.com/ar/contact', new DateTime(), 'always', '0.5', $alternates);
            $generator->addUrl('propertytr.com/about', new DateTime(), 'always', '0.5', $alternates);
            $generator->addUrl('propertytr.com/ar/about', new DateTime(), 'always', '0.5', $alternates);
            $generator->addUrl('propertytr.com/search', new DateTime(), 'always', '0.5', $alternates);
            $generator->addUrl('propertytr.com/ar/search', new DateTime(), 'always', '0.5', $alternates);
            $generator->addUrl('propertytr.com/projects', new DateTime(), 'always', '0.5', $alternates);
            $generator->addUrl('propertytr.com/ar/projects', new DateTime(), 'always', '0.5', $alternates);
            $generator->addUrl('propertytr.com/news', new DateTime(), 'always', '0.5', $alternates);
            $generator->addUrl('propertytr.com/ar/news', new DateTime(), 'always', '0.5', $alternates);
            $generator->addUrl('propertytr.com/nuyer_guide', new DateTime(), 'always', '0.5', $alternates);
            $generator->addUrl('propertytr.com/ar/buyer_guide', new DateTime(), 'always', '0.5', $alternates);

            $this->load->model('admin_model');
            $arr   = $this->admin_model->sitemap_getir();
            $say   = count($arr);
            $dongu = $say - 1;
            for ($i = 0; $i <= $dongu; $i++) {
                $generator->addUrl('propertytr.com/' . $arr[$i]["seo_adi"], new DateTime(), 'always', '0.5', $alternates);
                $generator->addUrl('propertytr.com/ar/' . $arr[$i]["seo_adi"], new DateTime(), 'always', '0.5', $alternates);

            }

// generating internally a sitemap
            $generator->createSitemap();

// writing early generated sitemap to file
            $generator->writeSitemap();

            $this->load->library('messages');
            $this->messages->True_Add("yonetim");
        }
    }

    public function tip_kontrol()
    {

        $tip = $_POST["tip"];

        $tip = trim($tip);
        $tip = strip_tags($tip);
        $tip = htmlentities($tip);
        $this->load->model('admin_model');
        echo $tip_kontrol = $this->admin_model->tip_kontrol($tip);

    }

    public function db_aktar()
    {
		return FALSE;

        $CI        = &get_instance();
        $this->db3 = $CI->load->database('db3', true);

        //Haber Kat
        $sql     = "SELECT * FROM posts_categories";
        $query   = $this->db3->query($sql);
        $hab_kat = $query->result_array();

        //Pro Kat
        $sql    = "SELECT * FROM locations_cities";
        $query  = $this->db3->query($sql);
        $pr_kat = $query->result_array();

        //Haber
        $sql   = "SELECT * FROM posts";
        $query = $this->db3->query($sql);
        $hab   = $query->result_array();

        //Proje
        $sql   = "SELECT * FROM projects";
        $query = $this->db3->query($sql);
        $pr    = $query->result_array();

        //Ayar
        $sql   = "SELECT * FROM options";
        $query = $this->db3->query($sql);
        $op    = $query->result_array();

        //Yorum
        $sql   = "SELECT * FROM comments";
        $query = $this->db3->query($sql);
        $yo    = $query->result_array();

        //Ünite Tip  2       //Proje Tip 1    //İç Özellik 6

        $sql   = "SELECT * FROM projects_attributes";
        $query = $this->db3->query($sql);
        $ut    = $query->result_array();

        $CI        = &get_instance();
        $this->db2 = $CI->load->database('db2', true);

        if ($hab_kat): foreach ($hab_kat as $dizi):
                $insert = array(
                    'haber_kategori_id' => $dizi["id"],
                    'kategori_adi'      => $dizi["title"],
                    'seo_adi'           => $dizi["slug"],
                    'title'             => $dizi["meta_title"],
                    'description'       => $dizi["description"],
                );
                //     $into = $this->db2->insert('haber_kategori', $insert);
            endforeach;endif;

        if ($pr_kat): foreach ($pr_kat as $dizi):
                $insert = array(
                    'kategori_id'       => $dizi["id"],
                    'kategori_adi'      => $dizi["title"],
                    'kategori_on_yazi'  => $dizi["meta_title"],
                    'kategori_aciklama' => $dizi["meta_description"],
                    'seo_adi'           => $dizi["slug"],
                    'description'       => $dizi["description"],
                    'title'             => $dizi["meta_title"],
                    'resim'             => "79412-anasayfa_kategori.png",
                    'resim_alt'         => "Alt",
                    'resim_title'       => "Title",
                );
                //    $into = $this->db2->insert('kategori', $insert);
            endforeach;endif;

        if ($hab): foreach ($hab as $dizi):
                if ($dizi["categories"] == 5) {$cat = 0;} else { $cat = $dizi["categories"];}

                $insert = array(
                    'haber_id'       => $dizi["id"],
                    'baslik'         => $dizi["title"],
                    'icerik'         => $dizi["content"],

                    'kategori_id'    => $cat,
                    'seo_adi'        => $dizi["slug"],
                    'tarih'          => $dizi["created_at"],
                    'tarih_ar'       => $dizi["created_at"],
                    'description'    => $dizi["meta_description"],
                    'title'          => $dizi["meta_title"],
                    'manset'         => 1,
                    'resim'          => "c1750-haberdetay_buyuk.png",
                    'banner_1'       => "b59f1-haberdetay_alt.png",
                    'banner_2'       => "4bf4d-haber_anasayfa_buyuk.png",
                    'resim_alt'      => "Alt",
                    'resim_title'    => "Title",
                    'banner_1_alt'   => "Alt",
                    'banner_1_title' => "Title",
                    'banner_2_alt'   => "Alt",
                    'banner_2_title' => "Title",

                );
                //  $into = $this->db2->insert('haber', $insert);
            endforeach;endif;

        if ($pr): foreach ($pr as $dizi):
                $insert = array(
                    'proje_id'    => $dizi["id"],
                    'proje_adi'   => $dizi["title"],
                    //    'proje_yeri'        => $dizi["description"],
                    'kategori'    => $dizi["cities"],
                    //      'whatsapp'        => $dizi["slug"],
                    //    'email'        => $dizi["created_at"],
                    'proje_tarih' => $dizi["dueDate"],
                    'min_fiyat'   => $dizi["price_min"],
                    'max_fiyat'   => $dizi["price_max"],
                    'min_m2'      => $dizi["m2_max"],
                    'max_m2'      => $dizi["m2_min"],
                    //        'proje_durum'        => $dizi["meta_title"],
                    //        'total_apartments'        => $dizi["meta_title"],
                    //        'total_land_side'        => $dizi["meta_title"],
                    //       'park_kapasite'        => $dizi["meta_title"],
                    'Aciklama'    => $dizi["description"],
                    'Ozellikler'  => $dizi["content"],
                    //       'Location'        => $dizi["meta_title"],
                    //      'telefon'        => $dizi["meta_title"],
                    'seo_adi'     => $dizi["slug"],
                    'maps_linki'  => "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3011.001472031727!2d28.819579314842066!3d41.00334097930122!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14caa58981b6ebc9%3A0xc767d5d4fd6ddb69!2sDelsa%20Otomotiv!5e0!3m2!1str!2str!4v1576660658170!5m2!1str!2str",
                    //       'facebook'        => $dizi["meta_title"],
                    //       'instagram'        => $dizi["meta_title"],
                    //       'twitter'        => $dizi["meta_title"],
                    //       'youtube'        => $dizi["meta_title"],
                    'favori'      => 1,
                    'manset'      => 1,
                    'description' => $dizi["meta_description"],
                    'title'       => $dizi["meta_title"],

                    'banner_1'    => "2c98e-anasayfa_kategori.png",
                    'banner_2'    => "41592-anasayfa_yeni_proje.png",
                    'banner_3'    => "45238-i1.png",
                    'harita_lat'  => $dizi["latitude"],
                    'harita_lon'  => $dizi["longitude"],

                );
                //    $into = $this->db2->insert('projeler', $insert);
            endforeach;endif;

        if ($op): foreach ($op as $dizi):
                $insert = array(
                    'id'            => 1,
                    'facebook'      => $dizi["facebook"],
                    'twitter'       => $dizi["twitter"],
                    'google'        => $dizi["google"],
                    'instagram'     => $dizi["instagram"],
                    'linkedin'      => $dizi["linkedin"],
                    'pinterest'     => "http://www.pinterest.com",
                    'youtube'       => $dizi["youtube"],
                    'email'         => $dizi["email"],
                    'email_2'       => "",
                    'tel_1'         => $dizi["phone1"],
                    'tel_2'         => $dizi["phone2"],
                    'whatsapp'      => "",
                    'fax'           => "",
                    'adress'        => $dizi["address"],
                    'company_name'  => "Property",
                    'seo_keywords'  => $dizi["keywords"],
                    //    'maps'        => $dizi["m2_min"],
                    'kisa_aciklama' => $dizi["title"],
                    'uzun_aciklama' => $dizi["description"],
                    //      'ana_arkaplan_yazi'        => $dizi["m2_min"],
                    //      'anasayfa_description'        => $dizi["m2_min"],
                    //      'contact_description'        => $dizi["m2_min"],
                    //      'proje_description'        => $dizi["m2_min"],
                    //     'news_description'        => $dizi["m2_min"],
                    //      'anasayfa_title'        => $dizi["m2_min"],
                    //     'contact_title'        => $dizi["m2_min"],
                    //     'proje_title'        => $dizi["m2_min"],
                    //      'news_title'        => $dizi["m2_min"],

                );

                //   $into = $this->db2->insert('ayar', $insert);
            endforeach;endif;

        if ($yo): foreach ($yo as $dizi):
                $insert = array(

                    'yorum_id'    => $dizi["id"],
                    'kim'         => $dizi["name"],
                    'yer'         => "Real Estate Luxury",
                    'yazi'        => $dizi["message"],
                    'resim'       => "b8458-anasayfa_yorum_resim.png",
                    'resim_alt'   => "Alt",
                    'resim_title' => "Title",
                    'durum'       => 1,

                );

                // $into = $this->db2->insert('yorum', $insert);
            endforeach;endif;

        if ($ut): foreach ($ut as $dizi):
                if ($dizi["group"] == 2) {
                    $insert = array(
                        'unite_adi'    => $dizi["title"],
                        'unite_adi_ar' => "لوريم ايبسوم",
                    );
                    $into = $this->db2->insert('unite_tip', $insert);

                }

            endforeach;endif;

    }
	
	
	
	
	   public function db_aktar_frs()
    {
return FALSE;
        $sql     = "SELECT * FROM alt_kategori";
        $query   = $this->db->query($sql);
        $alt_kategori = $query->result_array();
		


        $sql     = "SELECT * FROM ayar";
        $query   = $this->db->query($sql);
        $ayar = $query->result_array();

        $sql     = "SELECT * FROM dil";
        $query   = $this->db->query($sql);
        $dil = $query->result_array();

        $sql     = "SELECT * FROM haber";
        $query   = $this->db->query($sql);
        $haber = $query->result_array();

        $sql     = "SELECT * FROM haber_kategori";
        $query   = $this->db->query($sql);
        $haber_kategori = $query->result_array();

        $sql     = "SELECT * FROM hakkimizda";
        $query   = $this->db->query($sql);
        $hakkimizda = $query->result_array();

        $sql     = "SELECT * FROM kategori";
        $query   = $this->db->query($sql);
        $kategori = $query->result_array();

        $sql     = "SELECT * FROM link";
        $query   = $this->db->query($sql);
        $link = $query->result_array();
		
        $sql     = "SELECT * FROM projeler";
        $query   = $this->db->query($sql);
        $projeler = $query->result_array();		
		
		
        $sql     = "SELECT * FROM proje_fiyat";
        $query   = $this->db->query($sql);
        $proje_fiyat = $query->result_array();		
		
		
        $sql     = "SELECT * FROM proje_ozellik";
        $query   = $this->db->query($sql);
        $proje_ozellik = $query->result_array();		
		

        $sql     = "SELECT * FROM proje_ozellik_iliski";
        $query   = $this->db->query($sql);
        $proje_ozellik_iliski = $query->result_array();
		
		
        $sql     = "SELECT * FROM proje_resimler";
        $query   = $this->db->query($sql);
        $proje_resimler = $query->result_array();		
		
		
        $sql     = "SELECT * FROM proje_tip";
        $query   = $this->db->query($sql);
        $proje_tip = $query->result_array();		
		
		
        $sql     = "SELECT * FROM proje_tip_iliski";
        $query   = $this->db->query($sql);
        $proje_tip_iliski = $query->result_array();		
		
		
	    $sql     = "SELECT * FROM servis";
        $query   = $this->db->query($sql);
        $servis = $query->result_array();

        $sql     = "SELECT * FROM unite_tip";
        $query   = $this->db->query($sql);
        $unite_tip = $query->result_array();

        $sql     = "SELECT * FROM unite_tip_iliski";
        $query   = $this->db->query($sql);
        $unite_tip_iliski = $query->result_array();


        $sql     = "SELECT * FROM uyeler";
        $query   = $this->db->query($sql);
        $uyeler = $query->result_array();


        $sql     = "SELECT * FROM yorum";
        $query   = $this->db->query($sql);
        $yorum = $query->result_array();



			if ($ayar): foreach ($ayar as $dizi):
                $insert = array(
                    'adress_frs'    => $dizi["adress_ar"],
                    'kisa_aciklama_frs'    => $dizi["kisa_aciklama_ar"],					
                    'tel_1_frs'    => $dizi["tel_1_ar"],					
                    'whatsapp_frs'    => $dizi["whatsapp_ar"],					
                    'tel_2_frs'    => $dizi["tel_2_ar"],					
                    'fax_frs'    => $dizi["fax_ar"],					
                    'ana_arkaplan_yazi_frs'    => $dizi["ana_arkaplan_yazi_ar"],
                    'anasayfa_description_frs'    => $dizi["anasayfa_description_ar"],
                    'contact_description_frs'    => $dizi["contact_description_ar"],					
                    'proje_description_frs'    => $dizi["proje_description_ar"],					
                    'news_description_frs'    => $dizi["news_description_ar"],					
                    'anasayfa_title_frs'    => $dizi["anasayfa_title_ar"],					
                    'contact_title_frs'    => $dizi["contact_title_ar"],					
                    'proje_title_frs'    => $dizi["proje_title_ar"],
                    'news_title_frs'    => $dizi["news_title_ar"],					
                    'uzun_aciklama_frs'    => $dizi["uzun_aciklama_ar"],
				
                );
               $this->db->where('id', $dizi["id"]);
                $into = $this->db->update('ayar', $insert);
            endforeach;endif;
			
			/*******/
			
				if ($dil): foreach ($dil as $dizi):
                $insert = array(
                    'frs'    => $dizi["ar"],

				
                );
               $this->db->where('id', $dizi["id"]);
                $into = $this->db->update('dil', $insert);
            endforeach;endif;		
			
			
				/*******/
			
				if ($haber): foreach ($haber as $dizi):
                $insert = array(
                    'tarih_frs'    => $dizi["tarih_ar"],
                    'baslik_frs'    => $dizi["baslik_ar"],
                    'icerik_frs'    => $dizi["icerik_ar"],
                    'description_frs'    => $dizi["description_ar"],
                    'title_frs'    => $dizi["title_ar"],
					
                );
               $this->db->where('haber_id', $dizi["haber_id"]);
                $into = $this->db->update('haber', $insert);
            endforeach;endif;			
			
			
					/*******/
			
				if ($haber_kategori): foreach ($haber_kategori as $dizi):
                $insert = array(
                    'kategori_adi_frs'    => $dizi["kategori_adi_ar"],
                    'title_frs'    => $dizi["title_ar"],
                    'description_frs'    => $dizi["description_ar"],

					
                );
               $this->db->where('haber_kategori_id', $dizi["haber_kategori_id"]);
                $into = $this->db->update('haber_kategori', $insert);
            endforeach;endif;	
	
	
	
	
						/*******/
			
				if ($hakkimizda): foreach ($hakkimizda as $dizi):
                $insert = array(
                    'baslik_frs'    => $dizi["baslik_ar"],
                    'yazi_frs'    => $dizi["yazi_ar"],
                    'vizyon_frs'    => $dizi["vizyon_ar"],
                    'misyon_frs'    => $dizi["misyon_ar"],
                    'alan_1_baslik_frs'    => $dizi["alan_1_baslik_ar"],
                    'alan_1_yazi_frs'    => $dizi["alan_1_yazi_ar"],
                    'alan_2_baslik_frs'    => $dizi["alan_2_baslik_ar"],
                    'alan_2_yazi_frs'    => $dizi["alan_2_yazi_ar"],
                    'alan_3_baslik_frs'    => $dizi["alan_3_baslik_ar"],
                    'alan_3_yazi_frs'    => $dizi["alan_3_yazi_ar"],
                    'alan_4_baslik_frs'    => $dizi["alan_4_baslik_ar"],
                    'alan_4_yazi_frs'    => $dizi["alan_4_yazi_ar"],
                    'alan_5_baslik_frs'    => $dizi["alan_5_baslik_ar"],
                    'alan_5_yazi_frs'    => $dizi["alan_5_yazi_ar"],
                    'about_description_frs'    => $dizi["about_description_ar"],
                    'about_title_frs'    => $dizi["about_title_ar"],





					
                );
               $this->db->where('about_id', $dizi["about_id"]);
                $into = $this->db->update('hakkimizda', $insert);
            endforeach;endif;	
	
	
	
	
							/*******/
			
				if ($kategori): foreach ($kategori as $dizi):
                $insert = array(
                    'kategori_adi_frs'    => $dizi["kategori_adi_ar"],
                    'kategori_aciklama_frs'    => $dizi["kategori_aciklama_ar"],
                    'kategori_on_yazi_frs'    => $dizi["kategori_on_yazi_ar"],
                    'description_frs'    => $dizi["description_ar"],
                    'title_frs'    => $dizi["title_ar"],




					
                );
               $this->db->where('kategori_id', $dizi["kategori_id"]);
                $into = $this->db->update('kategori', $insert);
            endforeach;endif;	
	
	
	
	
								/*******/
			
				if ($link): foreach ($link as $dizi):
                $insert = array(
                    'link_frs'    => $dizi["link_ar"],
                    'adi_frs'    => $dizi["adi_ar"],
					
                );
               $this->db->where('id', $dizi["id"]);
                $into = $this->db->update('link', $insert);
            endforeach;endif;	
	
	
									/*******/
			
				if ($projeler): foreach ($projeler as $dizi):
                $insert = array(
                    'proje_adi_frs'    => $dizi["proje_adi_ar"],
                    'proje_yeri_frs'    => $dizi["proje_yeri_ar"],
                    'min_fiyat_frs'    => $dizi["min_fiyat_ar"],
                    'max_fiyat_frs'    => $dizi["max_fiyat_ar"],
                    'min_m2_frs'    => $dizi["min_m2_ar"],
                    'max_m2_frs'    => $dizi["max_m2_ar"],
                    'proje_durum_frs'    => $dizi["proje_durum_ar"],
                    'total_apartments_frs'    => $dizi["total_apartments_ar"],
                    'total_land_side_frs'    => $dizi["total_land_side_ar"],
                    'park_kapasite_frs'    => $dizi["park_kapasite_ar"],
                    'Aciklama_frs'    => $dizi["Aciklama_ar"],
                    'Ozellikler_frs'    => $dizi["Ozellikler_ar"],
                    'Location_frs'    => $dizi["Location_ar"],
                    'telefon_frs'    => $dizi["telefon_ar"],
                    'adres_frs'    => $dizi["adres_ar"],
                    'proje_tarih_frs'    => $dizi["proje_tarih_ar"],
                    'description_frs'    => $dizi["description_ar"],
                    'title_frs'    => $dizi["title_ar"],

					
                );
               $this->db->where('proje_id', $dizi["proje_id"]);
                $into = $this->db->update('projeler', $insert);
            endforeach;endif;
	
	
	
	
	
									/*******/
			
				if ($proje_ozellik): foreach ($proje_ozellik as $dizi):
                $insert = array(
                    'ozellik_adi_frs'    => $dizi["ozellik_adi_ar"],


					
                );
               $this->db->where('proje_ozellik_id', $dizi["proje_ozellik_id"]);
                $into = $this->db->update('proje_ozellik', $insert);
            endforeach;endif;
	
	
										/*******/
			
				if ($proje_tip): foreach ($proje_tip as $dizi):
                $insert = array(
                    'tip_adi_frs'    => $dizi["tip_adi_ar"],


					
                );
               $this->db->where('proje_tip_id', $dizi["proje_tip_id"]);
                $into = $this->db->update('proje_tip', $insert);
            endforeach;endif;
	
	
	
	
	
											/*******/
			
				if ($servis): foreach ($servis as $dizi):
                $insert = array(
                    'alan_1_baslik_frs'    => $dizi["alan_1_baslik_ar"],
                    'alan_1_yazi_frs'    => $dizi["alan_1_yazi_ar"],
                    'alan_2_baslik_frs'    => $dizi["alan_2_baslik_ar"],
                    'alan_2_yazi_frs'    => $dizi["alan_2_yazi_ar"],					
                    'alan_3_baslik_frs'    => $dizi["alan_3_baslik_ar"],
                    'alan_3_yazi_frs'    => $dizi["alan_3_yazi_ar"],
                    'alan_4_baslik_frs'    => $dizi["alan_4_baslik_ar"],
                    'alan_4_yazi_frs'    => $dizi["alan_4_yazi_ar"],					
					
                );
               $this->db->where('servis_id', $dizi["servis_id"]);
                $into = $this->db->update('servis', $insert);
            endforeach;endif;
	
	
	
												/*******/
			
				if ($yorum): foreach ($yorum as $dizi):
                $insert = array(
                    'kim_frs'    => $dizi["kim_ar"],
                    'yer_frs'    => $dizi["yer_ar"],
                    'yazi_frs'    => $dizi["yazi_ar"],
				
					
                );
               $this->db->where('yorum_id', $dizi["yorum_id"]);
                $into = $this->db->update('yorum', $insert);
            endforeach;endif;
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
