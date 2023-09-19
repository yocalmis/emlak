


<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Money extends CI_Controller {

  public function __construct() {

    parent::__construct();

    // load base_url
    $this->load->helper('url');
  }

  public function index($br=null){


                       $this->load->library('messages');
					   
if(($br!='try') and ($br!='euro') and ($br!='dolar') and ($br!='ruble')	)
{
	
if($this->session->userdata('lng')=="en"){$this->messages->config("");}
if($this->session->userdata('lng')=="ar"){$this->messages->config("ar");}
if($this->session->userdata('lng')=="frs"){$this->messages->config("frs");}	
	
}	


$this->session->set_userdata('para_birim', $this->session->userdata($br)  );
if($br=="try"){$ic="fa-lira-sign";}  if($br=="euro"){$ic="fa-euro-sign";}  if($br=="dolar"){$ic="fa-dollar-sign";}  if($br=="ruble"){$ic="fa-ruble-sign";}
$this->session->set_userdata('para_icon',$ic);

	


$this->session->userdata('para_icon');
$this->session->userdata('para_birim');


$this->messages->configss("");
return FALSE;



if($this->session->userdata('lng')=="en"){$this->messages->config("");}
if($this->session->userdata('lng')=="ar"){$this->messages->config("ar");}
if($this->session->userdata('lng')=="frs"){$this->messages->config("frs");}

                        
  }

}

?>