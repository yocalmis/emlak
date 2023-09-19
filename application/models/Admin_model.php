<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Admin_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    //Admin Varm� Yokmu Kontrol Et , Varsa Login'e Yoksa Kay�t sayfas�na y�nlendir

    public function admin_query()
    {

        $sql   = "SELECT * FROM uyeler";
        $query = $this->db->query($sql);

        if ($query->num_rows() > 0) {
            return true;
        } else {
            return false;
        }

    }

    public function admin_register_before($username, $email)
    {

        $sql   = "SELECT * FROM uyeler Where username='$username' or email='$email'";
        $query = $this->db->query($sql);

        if ($query->num_rows() > 0) {
            return true;
        } else {
            return false;
        }

    }

    public function admin_register($data)
    {
        $name     = $this->db->escape_str($data[0]);
        $email    = $this->db->escape_str($data[1]);
        $username = $this->db->escape_str($data[2]);
        $pass     = $this->db->escape_str($data[3]);
        $bina_adi = $this->db->escape_str($data[4]);

        $bugun  = date("Y-m-d");
        $ondort = date("d.m.Y", strtotime('+14 days'));
        $ondort = explode(".", $ondort);
        $ondort = $ondort[2] . "-" . $ondort[1] . "-" . $ondort[0];

        $insert = array(
            'name'     => $name,
            'username' => $username,
            'pass'     => $pass,
            'email'    => $email,
            'status'   => 0,
            'bas_tar'  => $bugun,
            'bit_tar'  => $ondort,
            'uye_turu' => 1,

        );

        $into = $this->db->insert('uyeler', $insert);
        if ($into) {

            $insertId = $this->db->insert_id();
            $insert2  = array(
                'kullanici_id' => $insertId,

            );
            $this->db->where('id', $insertId);
            $into2 = $this->db->update('uyeler', $insert2);

            $insert3 = array(
                'adi'          => $bina_adi,
                'kullanici_id' => $insertId,

            );

            $binakayit     = $this->db->insert('bina', $insert3);
            $bina_insertId = $this->db->insert_id();

            if ($into2) {return $pass;} else {return 0;}

        } else {return 0;}

    }

    public function uye_onay($pass)
    {

        $insert = array(
            'status' => 1,

        );
        $this->db->where('pass', $pass);
        $into = $this->db->update('uyeler', $insert);
        if ($into) {

            return 1;

        } else {return 0;}

    }

    public function mails($pass)
    {

        $query = $this->db->query("select * from uyeler Where pass='$pass'");
        foreach ($query->result_array() as $row) {
            return $row['email'];
        }

    }

    public function admin_return($data)
    {

        $username = $this->db->escape_str($data[0]);
        $pass     = $this->db->escape_str($data[1]);
        $bugun    = date("Y-m-d");

        $query = $this->db->query("select * from uyeler Where username='$username' and pass='$pass' and status=1");
        if ($query->num_rows() > 0) {

            $query2 = $this->db->query("select * from uyeler Where username='$username' and pass='$pass' and status=1 and bas_tar<='" . $bugun . "' and bit_tar >='" . $bugun . "' ");
            if ($query2->num_rows() > 0) {

                foreach ($query2->result_array() as $row2) {
                    $uye_turu     = $row2['uye_turu'];
                    $kullanici_id = $row2['kullanici_id'];
                }

                if ($uye_turu != 2) {
                    return 1;
                }

                if ($uye_turu == 2) {
                    $kullanici_id_tarih_kontrol = $this->kullanici_id_tarih_kontrol($kullanici_id);
                    if ($kullanici_id_tarih_kontrol != 1) {

                        return 0;

                    }
                    return 1;

                }

            } else {

                foreach ($query->result_array() as $row) {
                    $uye_turu     = $row['uye_turu'];
                    $kullanici_id = $row['kullanici_id'];
                }

                if ($uye_turu == 2) {
                    return 0;
                } else {

                    return 2;

                }

            }

        } else {

            return 0;
        }

        $query = $this->db->query("select * from uyeler Where username='$username' and pass='$pass' and status=1 and bas_tar<='" . $bugun . "' and bit_tar >='" . $bugun . "' ");
        if ($query->num_rows() > 0) {

            foreach ($query->result_array() as $row) {
                $uye_turu     = $row['uye_turu'];
                $kullanici_id = $row['kullanici_id'];
            }

            $kullanici_id_tarih_kontrol = $this->kullanici_id_tarih_kontrol($kullanici_id);

            if ($uye_turu == 2) {
                if ($kullanici_id_tarih_kontrol != 1) {

                    return 0;

                }
                return 1;

            } else {
                if ($kullanici_id_tarih_kontrol != 1) {

                    return 2;

                }
                return 1;

            }

        } else {

            return 0;

        }

    }

    public function admin_bilgi($data)
    {
        $username = $this->db->escape_str($data[0]);
        $pass     = $this->db->escape_str($data[1]);

        $query = $this->db->query("select * from uyeler Where username='$username' and pass='$pass' ");
        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return false;
        }

    }
	
	
	    public function proje_getir()
    {


        $query = $this->db->query("select proje_id,proje_adi from projeler where type='proje'");
        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return false;
        }

    }

    public function para_birimi($kullanici_id)
    {

        $query = $this->db->query("select * from bina Where kullanici_id=" . $kullanici_id . "");
        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return false;
        }

    }

    public function kontrol($email)
    {

        $query = $this->db->query("select * from uyeler Where email='$email'");
        if ($query->num_rows() > 0) {
            return 1;
        } else {
            return 0;
        }

    }

    public function pass_getir($email)
    {

        $query = $this->db->query("select * from uyeler Where email='$email'");
        if ($query->num_rows() > 0) {

            foreach ($query->result_array() as $row) {
                return $row['pass'];

            }

        } else {
            return false;
        }

    }

    public function sifre_guncelle($sf, $pass)
    {

        $insert = array(
            'pass' => $sf,

        );
        $this->db->where('pass', $pass);
        $into = $this->db->update('uyeler', $insert);
        if ($into) {return 1;} else {return 0;}

    }

    public function uye_turu_getir($online)
    {
        $query = $this->db->query("select * from uyeler Where username='$online'");
        foreach ($query->result_array() as $row) {
            return $row['uye_turu'];
        }

    }

    public function uye_id_getir($online)
    {
        $query = $this->db->query("select * from uyeler Where username='$online'");
        foreach ($query->result_array() as $row) {
            return $row['id'];
        }

    }

    public function yetki_kontrol_bina($kul_id, $id)
    {
        $query = $this->db->query("select * from bina Where id=" . $id . " and kullanici_id=" . $kul_id . "");
        if ($query->num_rows() > 0) {
            return true;
        } else {
            return false;
        }

    }

    public function ebeveyn_adi_getir($id)
    {

        $query = $this->db->query("select * from kategori Where kategori_id=" . $id);
        if ($query->num_rows() > 0) {

            foreach ($query->result_array() as $row) {
                return $row['adi'];

            }

        } else {
            return false;
        }

    }

    public function proje_kontrol($id, $adi)
    {

        $query = $this->db->query("select * from projeler Where proje_id='$id' and seo_adi='$adi'");
        if ($query->num_rows() > 0) {return 1;} else {return 0;}

    }

    public function resim_getir($id)
    {
		
        $sorgu = "";
        if ($id != 0) {$sorgu = " Where proje_id=".$id;}

        $sql   = "SELECT * FROM proje_resimler" . $sorgu;
        $query = $this->db->query($sql);

        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return false;
        }

    }
    
       public function resim_getir_genel($id)
    {
		
        $sorgu = "";
        $sorgu = " Where proje_id=".$id;

        $sql   = "SELECT * FROM proje_resimler" . $sorgu;
        $query = $this->db->query($sql);

        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return false;
        }

    }
    
    
    
    
    
    

    public function resim_kaydet($id, $name)
    {

        $insert = array(
            'proje_id' => $id,
            'foto'     => $name,

        );

        $into = $this->db->insert('proje_resimler', $insert);
        if ($into) {return 1;} else {return 0;}

    }

    public function resim_sil($foto_id, $prj_id, $foto_adi)
    {

        $query = $this->db->query("delete from proje_resimler Where id='$foto_id' and proje_id='$prj_id'");

        $q = unlink("assets/resimler/" . $foto_adi);
        if ($q) {return 1;} else {return 0;}

    }
    
      public function resim_sil_genel($foto_id,$foto_adi)
    {
       

         $query = $this->db->query("delete from proje_resimler Where id=".$foto_id);

        $q = unlink("assets/resim_url/" . $foto_adi);
        if ($q) {return 1;} else {return 0;}

    }

    public function alt_gunc($alt, $title, $id)
    {

        $insert = array(
            'alt'   => $alt,
            'title' => $title,

        );
        $this->db->where('id', $id);
        $into = $this->db->update('proje_resimler', $insert);
        if ($into) {return 1;} else {return 0;}

    }

    public function sitemap_getir()
    {

        $query     = $this->db->query("select seo_adi from kategori");
        $kat       = $query->result_array();
        $query     = $this->db->query("select seo_adi from haber_kategori");
        $haber_kat = $query->result_array();
        $query     = $this->db->query("select seo_adi from projeler");
        $projeler  = $query->result_array();
        $query     = $this->db->query("select seo_adi from haber");
        $haber     = $query->result_array();
        return array_merge($kat, $haber_kat, $projeler, $haber);

    }
	
	    public function tip_kontrol($tip)
    {

        $query     = $this->db->query("select * from proje_tip where proje_tip_id=".$tip);
        foreach ($query->result_array() as $row) {
           $tip_adi=$row['tip_adi'];
        }
        if(($tip_adi=="Villa")or($tip_adi=="Commercial")or($tip_adi=="commercial")or($tip_adi=="villa")){
			
			return 1;
			
		}
		return 0;


    }

}
