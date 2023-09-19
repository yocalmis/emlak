<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class User_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    public function ayar()
    {
        $query = $this->db->query("SELECT * FROM ayar");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function servis()
    {
        $query = $this->db->query("SELECT * FROM servis");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function yorum()
    {
        $query = $this->db->query("SELECT * FROM yorum where durum=1 and tur=1 order by yorum_id desc limit 0 , 5");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function hakkimizda()
    {
        $query = $this->db->query("SELECT * FROM hakkimizda");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function linkler()
    {
        $query = $this->db->query("SELECT * FROM link limit 0,6");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function arama($kat, $tip, $yer, $yer_adi = null, $oz)
    {
        // Projelerde kat ve proje yeri ara

        $q     = "";
        $arr[] = "";

        $sira[1]  = "Penthouse";
        $sira[2]  = "1+0";
        $sira[3]  = "1+1";
        $sira[4]  = "2+1";
        $sira[5]  = "3+1";
        $sira[6]  = "4+1";
        $sira[7]  = "4+2";
        $sira[8]  = "4+3";
        $sira[9]  = "5+1";
        $sira[10] = "5+2";
        $sira[11] = "5+3";
        $sira[12] = "6+1";
        $sira[13] = "6+2";
        $sira[14] = "6+3";
        $sira[15] = "7+1";
        $sira[16] = "7+2";
        $sira[17] = "7+3";
        $sira[18] = "8+1";
        $sira[19] = "8+2";
        $sira[20] = "8+3";
        $sira[21] = "8+4";
        $sira[22] = "9+1";
        $sira[23] = "9+2";
        $sira[24] = "9+3";
        $sira[25] = "9+4";
        $sira[26] = "9+5";

        $varmi = array_search($yer_adi, $sira);

        if ($varmi != "") {
            $don = $varmi;
        }

        if ($kat != "") {$q .= " Where kategori=" . $kat;}

        $query = $this->db->query("SELECT * FROM projeler" . $q);if ($query->num_rows() > 0) {$result = $query->result_array();} else {return false;}
        //Gelen proje id lerini proje tip ve özellikte ara

        $n                        = 0;if ($result): foreach ($result as $dizi):
                $arr[$dizi["proje_id"]] = 1;

                if ($tip != "") {
                    $query = $this->db->query("SELECT * FROM proje_tip_iliski where proje_tip_id=" . $tip . " and proje_id=" . $dizi["proje_id"]);
                    if ($query->num_rows() > 0) {} else {
                        $arr[$dizi["proje_id"]] = 0;
                        continue;}
                }

                if ($yer != "") {
                    if ($varmi != "") {
                        $yer_ara_unit = 0;
                        for ($s = 26; $s >= $don; $s--) {

                            $querys = $this->db->query("SELECT * FROM unite_tip where unite_adi='" . $sira[$s] . "'");
                            foreach ($querys->result_array() as $rows) {$uti = $rows['unite_tip_id'];}

                            $query = $this->db->query("SELECT * FROM unite_tip_iliski where unite_tip_id=" . $uti . " and proje_id=" . $dizi["proje_id"]);
                            if ($query->num_rows() > 0) {$yer_ara_unit = 1;} else {}

                        }

                        if ($yer_ara_unit != 1) {$arr[$dizi["proje_id"]] = 0;}
                    }
                }

                if (($yer == "") and ($oz == "")) {
                    $n = $n + 1;
                    continue;}

                $sql = " where pr_id=" . $dizi["proje_id"];
                if ($oz != "") {$sql .= " and price<=" . $oz;}

                if ($varmi != "") {

                    $yer_ara = 0;
                    for ($s = 26; $s >= $don; $s--) {

                        $querys = $this->db->query("SELECT * FROM unite_tip where unite_adi='" . $sira[$s] . "'");
                        foreach ($querys->result_array() as $rows) {$uti = $rows['unite_tip_id'];}

                        $sql .= " and unit_type=" . $uti;

                        $query = $this->db->query("SELECT * FROM proje_fiyat" . $sql);
                        $sql   = str_replace(" and unit_type=" . $uti, "", $sql);

                        if ($query->num_rows() > 0) {$yer_ara = 1;} else {}
                    }

                    if ($yer_ara != 1) {$arr[$dizi["proje_id"]] = 0;}
                } else {

                    $query = $this->db->query("SELECT * FROM proje_fiyat" . $sql);
                    if ($query->num_rows() > 0) {} else { $arr[$dizi["proje_id"]] = 0;}
                }

                $n = $n + 1;endforeach;endif;

        $son[] = "";
        $n     = 0;if ($result): foreach ($result as $dizi):

                if ($arr[$dizi["proje_id"]] == 1) {
                    $query   = $this->db->query("SELECT * FROM projeler where proje_id=" . $dizi["proje_id"]);
                    $son[$n] = $query->result_array();
                    $n       = $n + 1;
                    continue;
                }

            endforeach;endif;

        return $son;

    }

    public function proje_kat($adet = null)
    {
        $q     = "";if ($adet != null) {$q = "where ebeveyn=0 limit 0," . $adet . "";}
        $query = $this->db->query("SELECT * FROM kategori " . $q);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function proje_getir($parameter = null)
    {
        // tüm ,manset, favori , yeni    , benzer
        if ($parameter == "") {$q = "";}if ($parameter == "favori") {$q = "where favori=1 limit 0,12";}
        if ($parameter == "yeni") {$q = "order by proje_id desc limit 0,8";}if ($parameter == "benzer") {$q = "order by RAND() limit 4";}
        if ($parameter == "manset") {$q = "where manset=1 limit 0,4";}
        $query = $this->db->query("SELECT * FROM projeler " . $q);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	
	    public function proje_getir2($parameter = null)
    {
        // tüm ,manset, favori , yeni    , benzer
        if ($parameter == "") {$q = "";}if ($parameter == "favori") {$q = "where favori=1 and type='proje' limit 0,12";}
        if ($parameter == "yeni") {$q = "where type='daire' or type='villa' order by proje_id desc limit 0,8";}if ($parameter == "benzer") {$q = "order by RAND() limit 4";}
        if ($parameter == "manset") {$q = "where manset=1 and limit 0,4";}
        $query = $this->db->query("SELECT * FROM projeler " . $q);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	
    
     public function benzer_proje_getir($kat_id)
    {
        $q = "where kategori=".$kat_id." order by RAND() limit 4";
        $query = $this->db->query("SELECT * FROM projeler " . $q);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }  
    
      public function emlak_getir($kat_id)
    {
        $q = "where proje=".$kat_id." order by RAND() limit 4";
        $query = $this->db->query("SELECT * FROM projeler " . $q);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }  
    
     public function benzer_proje_daire($kat_id)
    {
        $q = "where type='daire' order by RAND() limit 4";
        $query = $this->db->query("SELECT * FROM projeler " . $q);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    } 
	
     public function benzer_proje_villa($kat_id)
    {
        $q = "where type='villa' order by RAND() limit 4";
        $query = $this->db->query("SELECT * FROM projeler " . $q);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    } 	
	
     public function benzer_proje_arsa($kat_id)
    {
        $q = "where type='arsa' order by RAND() limit 4";
        $query = $this->db->query("SELECT * FROM projeler " . $q);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    } 	
	
	
	
    public function haber_getir($parameter = null)
    {
        // tüm ,manset
        if ($parameter == "") {$q = "";}if ($parameter == "manset") {$q = "where manset=1 limit 0,5";}
        $query = $this->db->query("SELECT * FROM haber " . $q);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function alt_kat($n)
    {
        $query = $this->db->query("SELECT * FROM kategori where ebeveyn=" . $n);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function kat_proje($kat_id,$p)
    {
        $sql = " order by proje_id desc limit 0 , 21";
        if (($p != null) and ($p != 1)) {
            $getir = $p - 1;
            $limit = $getir * 21;
            $basla = $limit ;
            $son   = $p * 21;
            $sql   = " order by proje_id desc limit " . $basla . " , 21";
        }		
		
        $query = $this->db->query("SELECT * FROM projeler where kategori=" . $kat_id." ".$sql);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	
	
    public function kat_proje_tum($kat_id)
    {
        $query = $this->db->query("SELECT * FROM projeler where kategori=" . $kat_id);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }	
	
	

	
	
	    public function page($prop,$p)
    {
        $sql = " order by proje_id desc limit 0 , 21";
        if (($p != null) and ($p != 1)) {
            $getir = $p - 1;
            $limit = $getir * 21;
            $basla = $limit ;
            $son   = $p * 21;
            $sql   = " order by proje_id desc limit " . $basla . " , 21";
        }		
		
        $query = $this->db->query("SELECT * FROM projeler where type='" . $prop."'".$sql);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	
	
    public function page_tum($prop)
    {
        $query = $this->db->query("SELECT * FROM projeler where type='" . $prop."'");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	
		    public function rs($prop,$p)
    {
        $sql = " order by proje_id desc limit 0 , 21";
        if (($p != null) and ($p != 1)) {
            $getir = $p - 1;
            $limit = $getir * 21;
            $basla = $limit ;
            $son   = $p * 21;
            $sql   = " order by proje_id desc limit " . $basla . " , 21";
        }		
		
		if($prop=="rent"){$m=0;}
		if($prop=="sale"){$m=1;}		
		
        $query = $this->db->query("SELECT * FROM projeler where sat_kir='" . $m."'".$sql);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	
	
    public function rs_tum($prop)
    {
				if($prop=="rent"){$m=0;}
		if($prop=="sale"){$m=1;}	
        $query = $this->db->query("SELECT * FROM projeler where sat_kir='" . $m."'");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	
	
    public function tum_proje($p)
    {
        $sql = " order by proje_id desc limit 0 , 21";
        if (($p != null) and ($p != 1)) {
            $getir = $p - 1;
            $limit = $getir * 21;
            $basla = $limit ;
            $son   = $p * 21;
            $sql   = " order by proje_id desc limit " . $basla . " , 21";
        }

        $query = $this->db->query("SELECT * FROM projeler" . $sql);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	
	    public function tum_proje_tum()
    {

        $query = $this->db->query("SELECT * FROM projeler");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }


    public function tum_proje_2($p)
    {
        $sql = " order by proje_id desc limit 0 , 21";
        if (($p != null) and ($p != 1)) {
            $getir = $p - 1;
            $limit = $getir * 21;
            $basla = $limit ;
            $son   = $p * 21;
            $sql   = " order by proje_id desc limit " . $basla . " , 21";
        }

        $query = $this->db->query("SELECT * FROM projeler WHERE type='proje' " . $sql);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }

	    public function tum_proje_tum_2()
    {

        $query = $this->db->query("SELECT * FROM projeler WHERE type='proje'");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }


    public function kat_bilgi($prop)
    {
        $query = $this->db->query("SELECT * FROM kategori where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function haber_kat_bilgi($prop)
    {
        $query = $this->db->query("SELECT * FROM haber_kategori where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }

    public function haber_kat($adet = null)
    {
        $q     = "";if ($adet != null) {$q = "limit 0," . $adet . "";}
        $query = $this->db->query("SELECT * FROM haber_kategori order by haber_kategori_id desc " . $q);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }

    public function haber_kat_adi($prop)
    {
        $query = $this->db->query("SELECT * FROM haber_kategori where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['kategori_adi'];}}return false;
    }
    public function haber_kat_adi_ar($prop)
    {
        $query = $this->db->query("SELECT * FROM haber_kategori where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['kategori_adi_ar'];}}return false;
    }
 public function haber_kat_adi_frs($prop)
    {
        $query = $this->db->query("SELECT * FROM haber_kategori where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['kategori_adi_frs'];}}return false;
    }
    public function haber_buyer_adi($prop)
    {
        $query = $this->db->query("SELECT * FROM haber where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['baslik'];}}return false;
    }
    public function haber_buyer_adi_ar($prop)
    {
        $query = $this->db->query("SELECT * FROM haber where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['baslik_ar'];}}return false;
    }
	
  public function haber_buyer_adi_frs($prop)
    {
        $query = $this->db->query("SELECT * FROM haber where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['baslik_frs'];}}return false;
    }	
	
    public function haber_buyer_kat_id($prop)
    {
        $query = $this->db->query("SELECT * FROM haber where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['kategori_id'];}}return false;
    }
    public function haber_kat_adi_id($kt_id)
    {
        $query = $this->db->query("SELECT * FROM haber_kategori where haber_kategori_id=" . $kt_id);if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['kategori_adi'];}}return false;
    }
    public function haber_kat_adi_id_ar($kt_id)
    {
        $query = $this->db->query("SELECT * FROM haber_kategori where haber_kategori_id=" . $kt_id);if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['kategori_adi_ar'];}}return false;
    }
	
  public function haber_kat_adi_id_frs($kt_id)
    {
        $query = $this->db->query("SELECT * FROM haber_kategori where haber_kategori_id=" . $kt_id);if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['kategori_adi_frs'];}}return false;
    }	
	
    public function proje_kat_adi_id($kt_id)
    {
        $query = $this->db->query("SELECT * FROM kategori where kategori_id=" . $kt_id);if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['kategori_adi'];}}return false;
    }
    public function proje_kat_adi_id_ar($kt_id)
    {
        $query = $this->db->query("SELECT * FROM kategori where kategori_id=" . $kt_id);if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['kategori_adi_ar'];}}return false;
    }
	
	  public function proje_kat_adi_id_frs($kt_id)
    {
        $query = $this->db->query("SELECT * FROM kategori where kategori_id=" . $kt_id);if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['kategori_adi_frs'];}}return false;
    }
	
	
    public function haber_kat_seo_adi($kt_id)
    {
        $query = $this->db->query("SELECT * FROM haber_kategori where haber_kategori_id=" . $kt_id);if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['seo_adi'];}}return false;
    }
    public function proje_kat_seo_adi($kt_id)
    {
        $query = $this->db->query("SELECT * FROM kategori where kategori_id=" . $kt_id);if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['seo_adi'];}}return false;
    }
    public function kat_haber($hb_id = null,$p=null)
    {
		
		 $sql = " order by tarih desc limit 0 , 40";
        if (($p != null) and ($p != 1)) {
            $getir = $p - 1;
            $limit = $getir * 40;
            $basla = $limit;
            $son   = $p * 40;
            $sql   = " order by tarih desc limit " . $basla . " , 40";
        }	
		
        $q     = "";
		if ($hb_id != null) {$q = "where kategori_id=" . $hb_id;}if ($hb_id == 0) {$q = "where kategori_id=" . $hb_id;}
		$q.= $sql;
		
		
        $query = $this->db->query("SELECT * FROM haber " . $q );if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	  public function kat_haberler_adet($hb_id = null)
    {
        $query = $this->db->query("SELECT * FROM haber where kategori_id=" . $hb_id);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	
    public function kat_haber_manset_2($hb_id = null)
    {      
        $q     = "";if ($hb_id != null) {$q = " and kategori_id=" . $hb_id;}if ($hb_id == 0) {$q = " and kategori_id=" . $hb_id;}
        $query = $this->db->query("SELECT * FROM haber where haber_sayfa_manset=1 " . $q ."  order by haber_id desc limit 0 , 4");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	
	
    public function kat_haber_manset_2_buyuk($hb_id = null)
    {      
        $q     = "";if ($hb_id != null) {$q = " and kategori_id=" . $hb_id;}if ($hb_id == 0) {$q = " and kategori_id=" . $hb_id;}
        $query = $this->db->query("SELECT * FROM haber where haber_sayfa_manset_buyuk=1 " . $q ."  order by haber_id desc limit 0 , 4");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	
    public function kat_haber_tum($p)
    {
        $sql = " order by tarih desc limit 0 , 40";
        if (($p != null) and ($p != 1)) {
            $getir = $p - 1;
            $limit = $getir * 40;
            $basla = $limit;
            $son   = $p * 40;
            $sql   = " order by tarih desc limit " . $basla . " , 40";
        }

        $query = $this->db->query("SELECT * FROM haber where kategori_id!=0 " . $sql);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	
    public function kat_haber_manset()
    {
        $sql = " order by haber_id desc limit 0 , 4";
        $query = $this->db->query("SELECT * FROM haber where kategori_id!=0 and haber_sayfa_manset=1 " . $sql);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	
    public function kat_haber_manset_3()
    {
        $sql = " order by haber_id desc limit 4 , 8";
        $query = $this->db->query("SELECT * FROM haber where kategori_id!=0 and haber_sayfa_manset=1 " . $sql);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
		
	
    public function kat_haber_manset_buyuk()
    {
        $sql = " order by haber_id desc limit 0 , 1";
        $query = $this->db->query("SELECT * FROM haber where kategori_id!=0 and haber_sayfa_manset_buyuk=1 " . $sql);if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }		
	
    public function kat_haber_tum_hepsi()
    {
        $query = $this->db->query("SELECT * FROM haber  where kategori_id!=0 ");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function proje_detay($seo_adi)
    {
        $query = $this->db->query("SELECT * FROM projeler where seo_adi='" . $seo_adi . "'");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function haber_buyer_detay($seo_adi)
    {
        $query = $this->db->query("SELECT * FROM haber where seo_adi='" . $seo_adi . "'");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function benzer_haber_buyer($parameter, $prop)
    {
        $hb_kt_id = $this->haber_buyer_kat_id($prop);
        if ($parameter == "buyer") {$q = "where kategori_id=0";}if ($parameter != "buyer") {$q = "where kategori_id=" . $hb_kt_id;}
        $query = $this->db->query("SELECT * FROM haber " . $q . " and seo_adi!='" . $prop . "' order by RAND() limit 4");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function bul($prop)
    {

        $query = $this->db->query("SELECT * FROM kategori where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {return "kategori";}
        $query = $this->db->query("SELECT * FROM haber_kategori where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {return "haber_kategori";}
        $query = $this->db->query("SELECT * FROM projeler where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {return "proje";}
        $query = $this->db->query("SELECT * FROM haber where kategori_id=0 and seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {return "buyer";}
        $query = $this->db->query("SELECT * FROM haber where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {return "haber";}
        if ($prop == "buyer_guide") {return "buyer_kategori";}
        return "";
    }
	
    public function bul2($prop)
    {

        $query = $this->db->query("SELECT * FROM kategori where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {return "kategori";}
        $query = $this->db->query("SELECT * FROM haber_kategori where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {return "haber_kategori";}
        $query = $this->db->query("SELECT * FROM projeler where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {return "proje";}
        $query = $this->db->query("SELECT * FROM haber where kategori_id=0 and seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {return "buyer";}
        $query = $this->db->query("SELECT * FROM haber where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {return "haber";}
        if ($prop == "rent") {return "rs";}
        if ($prop == "sale") {return "rs";}
        if ($prop == "villa") {return "page";}
        if ($prop == "daire") {return "page";}
        if ($prop == "arsa") {return "page";}
        if ($prop == "proje") {return "proje";}
	
		
        return "";
    }	
	
	
	
    public function haber_kat_id_getir($prop)
    {
        $query = $this->db->query("SELECT * FROM haber_kategori where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['haber_kategori_id'];}}
    }
    public function kat_id_getir($prop)
    {
        $query = $this->db->query("SELECT * FROM kategori where seo_adi='" . $prop . "'");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['kategori_id'];}}
    }
    public function proje_ozellik_getir($id)
    {
        $query = $this->db->query("SELECT * FROM proje_ozellik_iliski where proje_id=" . $id . "");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function unite_tip_getir($id)
    {
        $query = $this->db->query("SELECT * FROM unite_tip_iliski where proje_id=" . $id . "");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function proje_tip_getir($id)
    {
        $query = $this->db->query("SELECT * FROM proje_tip_iliski where proje_id=" . $id . "");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function proje_resim_getir($id)
    {
        $query = $this->db->query("SELECT * FROM proje_resimler where proje_id=" . $id . "");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function unite_tip_ad_getir($id)
    {
        $query = $this->db->query("SELECT * FROM unite_tip where unite_tip_id=" . $id . "");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['unite_adi'];}}return false;
    }
    public function unite_tip_ad_getir_ar($id)
    {
        $query = $this->db->query("SELECT * FROM unite_tip where unite_tip_id=" . $id . "");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['unite_adi_ar'];}}return false;
    }
	
  public function unite_tip_ad_getir_frs($id)
    {
        $query = $this->db->query("SELECT * FROM unite_tip where unite_tip_id=" . $id . "");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['unite_adi_frs'];}}return false;
    }	
	
	
	
    public function proje_tip_ad_getir($id)
    {
        $query = $this->db->query("SELECT * FROM proje_tip where proje_tip_id=" . $id . "");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['tip_adi'];}}return false;
    }
    public function proje_oz_ad_getir($id)
    {
        $query = $this->db->query("SELECT * FROM proje_ozellik where proje_ozellik_id=" . $id . "");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['ozellik_adi'];}}return false;
    }
    public function unite_ad_getir($id)
    {
        $query = $this->db->query("SELECT * FROM unite_tip where unite_tip_id=" . $id . "");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['unite_adi'];}}return false;
    }
    public function unite_ad_getir_ar($id)
    {
        $query = $this->db->query("SELECT * FROM unite_tip where unite_tip_id=" . $id . "");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['unite_adi_ar'];}}return false;
    }
    public function proje_oz_ad_getir_ar($id)
    {
        $query = $this->db->query("SELECT * FROM proje_ozellik where proje_ozellik_id=" . $id . "");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['ozellik_adi_ar'];}}return false;
    }

    public function proje_tip_ad_getir_ar($id)
    {
        $query = $this->db->query("SELECT * FROM proje_tip where proje_tip_id=" . $id . "");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['tip_adi_ar'];}}return false;
    }
	
	
  public function unite_ad_getir_frs($id)
    {
        $query = $this->db->query("SELECT * FROM unite_tip where unite_tip_id=" . $id . "");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['unite_adi_frs'];}}return false;
    }
    public function proje_oz_ad_getir_frs($id)
    {
        $query = $this->db->query("SELECT * FROM proje_ozellik where proje_ozellik_id=" . $id . "");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['ozellik_adi_frs'];}}return false;
    }

    public function proje_tip_ad_getir_frs($id)
    {
        $query = $this->db->query("SELECT * FROM proje_tip where proje_tip_id=" . $id . "");if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {return $row['tip_adi_frs'];}}return false;
    }
	
	



    public function dil_getir()
    {
        $query = $this->db->query("SELECT * FROM dil");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function proje_ozellik_getir_tum()
    {
        $query = $this->db->query("SELECT * FROM proje_ozellik");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function unite_tip_getir_tum()
    {
        $query = $this->db->query("SELECT * FROM unite_tip");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }

    public function proje_tip_getir_tum()
    {
        $query = $this->db->query("SELECT * FROM proje_tip");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function proje_yeri()
    {
        $query = $this->db->query("SELECT proje_yeri FROM projeler group by proje_yeri");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
    public function proje_yeri_ar()
    {
        $query = $this->db->query("SELECT proje_yeri_ar FROM projeler group by proje_yeri_ar");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }
	
	
	   public function proje_yeri_frs()
    {
        $query = $this->db->query("SELECT proje_yeri_ar FROM projeler group by proje_yeri_frs");if ($query->num_rows() > 0) {return $query->result_array();}return false;
    }

}
