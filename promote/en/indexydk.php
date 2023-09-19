<?php

include 'projects.php';
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Property TR">
    <title>Property TR</title>
    <!-- Favicon -->
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">
    <!-- Icons -->
    <link href="./assets/vendor/nucleo/css/nucleo.css" rel="stylesheet">
    <link href="./assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Argon CSS -->
    <link type="text/css" href="./assets/css/kurumsal.css?v=1.0.1" rel="stylesheet">
    <link type="text/css" href="./assets/css/style.css?v=1.0.0" rel="stylesheet">
</head>

<body>


<section class="hfl">
    <div class="hfl1"><a href="https://api.whatsapp.com/send?phone=<?php echo str_replace(array(" ","+"),array("",""),$data["phone1"]); ?>"><img alt="" src="./assets/img/mb2.png" width="100%" ></a></div>
    <div class="hfl2"><a href="#bsa"><img alt="" src="./assets/img/mb1.png" width="100%" ></a></div>
</section>

<header class="header">
    <div class="container">
        <div class="row"><div class="col-12"><div class="logo"><a href="index.php" aria-label="propertytr"><img alt="" src="./assets/img/logo.png" width="200" ></a></div></div></div>

        <div class="row margin100">
            <div class="col-md-8 col-sm-12 margin70"><img alt=""class="slyazi" src="./assets/img/yazi.png"></div>
            <div class="col-md-4 col-sm-4 col-0 kpt1">
                <div class="syhbg shadow">

                    <form id="intro-register-form">
                        <div class="row">
                            <div class="col-5 mrgneksi1"><img alt="" src="./assets/img/mrs.png" width="130px"></div>
                            <div class="col-7 tright"><h5 style="color:#fff; font-weight: 600;"><?php echo $lang["call_text"]; ?></h5></div>
                        </div>

                        <input type="text" required placeholder="<?php echo $lang["name_surname"]; ?>" name="name" id="name" class="kinput margin20">
                        <input type="text" required placeholder="<?php echo $lang["phone"]; ?>" name="phone" id="phone" class="kinput margin15">
                        <input type="text" required placeholder="<?php echo $lang["email"]; ?>" name="email" id="email" class="kinput margin15">
                        <select required class="ktlist11 margin15" name="subject" id="subject">
                            <option value=""><?php echo $lang["interest"]; ?></option>

                            <?php
                            foreach ($projects as $qq => $r) {
                                ?>
                                <option value="<?php echo $r["name"]; ?>"><?php echo $r["name"]; ?></option>
                                <?php
                            }
                            ?>
                        </select>

                        <textarea required class="tinput margin15" placeholder="<?php echo $lang["message"]; ?>" name="message" id="message"></textarea>

                        <button class="btn btnkt2 margin15" type="submit"><?php echo $lang["send"]; ?></button>
                    </form>
                </div>
            </div>

        </div>

    </div>
</header>

<section>

    <div class="container">
        <?php
        foreach ($projects as $qq => $r){
        $qq += 1;
        ?>


        <div class="row margin40">
            <div class="col-lg-8 col-md-12 col-sm-12 mr-auto byz shadow">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-12"><span class="font22"><?php echo $r["name"]; ?></span></div>
                    <div class="col-lg-4 col-md-4 col-sm-12 tright margin10 bold"><?php echo $r["location"]; ?></div>
                </div>
                <div class=" margin20">
                    <div id="carouselExampleIndicators-<?php echo $qq; ?>" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">

                            <?php foreach ($r["images"] as $q => $x){
                                ?>
                                <li data-target="#carouselExampleIndicators-<?php echo $qq; ?>" data-slide-to="<?php echo $q; ?>" class="<?php if($q==0){ echo "active"; } ?>"></li>
                            <?php } ?>
                        </ol>
                        <div class="carousel-inner">
                            <?php foreach ($r["images"] as $q => $x){
                                ?>
                                <div class="carousel-item <?php if($q==0){ echo "active"; } ?>">
                                    <img class="d-block w-100" src="<?php echo $x; ?>" alt="First slide">
                                </div>
                            <?php } ?>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators-<?php echo $qq; ?>" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators-<?php echo $qq; ?>" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-8 col-md-12 col-sm-12 margin15">
                        <div class="row">

                            <div class="col-4"><div class="bgd">
                                    <div class="fleft"><img alt="" width="45px" src="./assets/img/1.png" ></div>
                                    <div class="fright"><?php echo $r["kutu1"]; ?></div>
                                </div>


                                <div class="col-4"><div class="bgd">
                                        <div class="fleft"><img alt="" width="45px" src="./assets/img/2.png" ></div>
                                        <div class="fright"><?php echo $r["kutu2"]; ?></div>
                                    </div>


                                    <div class="col-4"><div class="bgd">
                                            <div class="fleft"><img alt="" width="45px" src="./assets/img/4.png" ></div>
                                            <div class="fright"><?php echo $r["kutu3"]; ?></div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-12 col-sm-12">
                                    <div class="krmz mrgneksi"><?php echo $r["price"]; ?></div><div class="temiz"></div>
                                    <div class="r10 margin15"><a href="#bsa" class="btn dty"><?php echo $r["detail"]; ?></a></div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <?php

                    }

                    ?>



                </div>


</section>

<section id="bsa" class="kpt2">

    <div class="container">
        <div class="row margin100">
            <div class="col-12 mx-auto">
                <div class="syh3 shadow">

                    <form id="intro-register-form2">
                        <div class="row">
                            <div class="col-5 mrgneksi1"><img alt="" src="./assets/img/mrs.png" width="130px"></div>
                            <div class="col-7 tright"><h5 style="color:#fff; font-weight: 600;"><?php echo $lang["call_text"]; ?></h5></div>
                        </div>

                        <input type="text" required placeholder="<?php echo $lang["name_surname"]; ?>" name="name" id="name" class="kinput margin20">
                        <input type="text" required placeholder="<?php echo $lang["phone"]; ?>" name="phone" id="phone" class="kinput margin15">
                        <input type="text" required placeholder="<?php echo $lang["email"]; ?>" name="email" id="email" class="kinput margin15">
                        <select required class="ktlist11 margin15" name="subject" id="subject">
                            <option value=""><?php echo $lang["interest"]; ?></option>

                            <?php
                            foreach ($projects as $qq => $r) {
                                ?>
                                <option value="<?php echo $r["name"]; ?>"><?php echo $r["name"]; ?></option>
                                <?php
                            }
                            ?>
                        </select>

                        <textarea required class="tinput margin15" name="message" id="message" placeholder="<?php echo $lang["message"]; ?>"></textarea>

                        <button class="btn btnkt2 margin15" type="submit"><?php echo $lang["send"]; ?></button>

                    </form>
                </div>
            </div>
        </div>
    </div>

</section>




<footer class="margin100">

    <div class="bg3">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-12 mx-auto margin15">
                    <div class="fl1"><img alt="" width="45px" src="./assets/img/mp1.png" ></div>
                    <div class="fl2"><?php echo $data["address"]; ?></div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 mx-auto margin15">

                    <div class="fl1"><img alt="" width="45px" src="./assets/img/mp2.png" ></div>
                    <div class="fl3"><span class="font16"><?php echo $data["phone1"]; ?></span></div>


                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 mx-auto margin15">
                    <div class="fl1"><img alt="" width="45px" src="./assets/img/mp3.png" ></div>
                    <div class="fl3"><span class="font16"><?php echo $data["email"]; ?></span></div>


                </div>

                <div class="col-lg-3 col-md-6 col-sm-12 mx-auto margin25">


                    <a class="syl1 shadow" href="<?php echo $data["facebook"]; ?>" target="_blank"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                    <a class="syl1 shadow" href="<?php echo $data["instagram"]; ?>" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                    <a class="syl1 shadow" href="<?php echo $data["twitter"]; ?>" target="_blank"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                    <a class="syl1 shadow" href="<?php echo $data["youtube"]; ?>" target="_blank"><i class="fa fa-youtube" aria-hidden="true"></i></a>

                </div>
            </div>

        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-12 center">2019 @ Copyright PropertyTR</div>
        </div>
    </div>

</footer>
<div class="form-result modal-wrap" id="contactSuccess">
    <div class="modal-bg"></div>
    <div class="modal-content">
        <h4 class="modal-title"><i class="fa fa-check-circle"></i> Success!</h4>
        <p>We have received your email and will be responding to you soon.</p>
    </div>
</div>
<!-- /Form Sucess -->
<!-- form-error -->
<div class="form-result modal-wrap" id="contactError">
    <div class="modal-bg"></div>
    <div class="modal-content">
        <h4 class="modal-title"><i class="fa fa-times"></i> Error</h4>
        <p>There was an error sending your message.</p>
    </div>
</div>
<style>

    .modal-wrap {
        display: none;
    }
    .modal-bg {
        background: #333;
        opacity: 0.9;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 999999999999999;
    }
    .modal-content {
        background: #b6c6ad;
        font-size: 18px;
        top: 40%;
        margin-left: calc(50% - 125px);
        position: fixed;
        width: 250px;
        z-index: 9999999999999999;
        padding: 10px 20px;
    }
    .modal-content .modal-title {
        color: #029669;
        font-size: 22px;
        border-bottom: 1px solid #ccc;
        margin-bottom: 5px;
        font-weight: bold;
    }
    .modal-content p {
        font-size: 14px;
        margin-bottom: 0;
    }
    #contactError .modal-title {
        color: #fff;
    }

    @media (max-width: 575.98px) {
        .modal-content {
            background: #b6c6ad;
            font-size: 18px;
            position: fixed;
            top: 40%;
            left: 8%;
            margin-left: 0;
            width: 300px;
            z-index: 99999999;
            padding: 10px 20px;
        }
    }
</style>
<!-- Core -->
<script src="./assets/vendor/jquery/jquery.min.js"></script>
<script src="./assets/vendor/popper/popper.min.js"></script>
<script src="./assets/vendor/bootstrap/bootstrap.min.js"></script>
<script src="./assets/vendor/headroom/headroom.min.js"></script>
<!-- Optional JS -->
<script src="./assets/vendor/onscreen/onscreen.min.js"></script>
<script src="./assets/vendor/nouislider/js/nouislider.min.js"></script>
<script src="./assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<!-- Argon JS -->
<script src="./assets/js/pro.js?v=1.0.1"></script>
<script src="./assets/js/validate.js?v=1.0.1"></script>
<script>


    //======= Run on Document Ready ============
    $(document).ready(function(){

        //Register Form Validator and Ajax Sender
        var pContactError = $("#contactError");
        var pContactSuccess = $("#contactSuccess");


        //Intro - Register Form Validator and Ajax Sender
        $("#intro-register-form").validate({
            submitHandler: function(form) {
                $.ajax({
                    type: "POST",
                    url: "email.php",
                    data: {
                        "name": $("#intro-register-form #name").val(),
                        "email": $("#intro-register-form #email").val(),
                        "message": $("#intro-register-form #message").val(),
                        "subject": $("#intro-register-form #subject").val(),
                        "phone": $("#intro-register-form #phone").val()
                    },
                    success: function (data) {
                        console.log(data);
                        if (data == "success") {
                            pContactSuccess.fadeIn(300);
                            pContactError.addClass("hidden");

                            $("#intro-register-form #name, #intro-register-form #email,  #intro-register-form #message, #intro-register-form #subject, #intro-register-form #phone")
                                .val("")
                                .blur()
                                .closest(".control-group")
                                .removeClass("success")
                                .removeClass("error");

                            setTimeout(function(){
                                window.location.reload(1);
                            }, 3000);

                        } else {
                            pContactError.fadeIn(300);
                            pContactSuccess.addClass("hidden");
                        }
                    }

                });
            }
        });
        //Intro - Register Form Validator and Ajax Sender
        $("#intro-register-form2").validate({
            submitHandler: function(form) {
                $.ajax({
                    type: "POST",
                    url: "email.php",
                    data: {
                        "name": $("#intro-register-form2 #name").val(),
                        "email": $("#intro-register-form2 #email").val(),
                        "message": $("#intro-register-form2 #message").val(),
                        "subject": $("#intro-register-form2 #subject").val(),
                        "phone": $("#intro-register-form2 #phone").val()
                    },
                    success: function (data) {
                        console.log(data);
                        if (data == "success") {
                            pContactSuccess.fadeIn(300);
                            pContactError.addClass("hidden");

                            $("#intro-register-form2 #name, #intro-register-form2 #email,  #intro-register-form2 #message, #intro-register-form2 #subject, #intro-register-form2 #phone")
                                .val("")
                                .blur()
                                .closest(".control-group")
                                .removeClass("success")
                                .removeClass("error");

                            setTimeout(function(){
                                window.location.reload(1);
                            }, 3000);

                        } else {
                            pContactError.fadeIn(300);
                            pContactSuccess.addClass("hidden");
                        }
                    }

                });
            }
        });

        //Modal for Forms
        function hideModal() {
            $('.modal-wrap').fadeOut(300);
            return false;
        }

        $('.modal-wrap').on('click', function () {
            hideModal();
        });

        $('.modal-bg').on('click', function () {
            hideModal();
        });
    });
</script>
<!-- Start of HubSpot Embed Code -->
<script type="text/javascript" id="hs-script-loader" async defer src="//js.hs-scripts.com/5274217.js"></script>
<!-- End of HubSpot Embed Code -->

</body>

</html>