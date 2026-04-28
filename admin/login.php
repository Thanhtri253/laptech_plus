<?php require_once('../config.php') ?>
<!DOCTYPE html>
<html lang="en" class="" style="height: auto;">
 <?php require_once('inc/header.php') ?>
<body class="hold-transition login-page">
  <script>
    start_loader()
  </script>
  <style>
    body{
      background-image: url("<?php echo validate_image($_settings->info('cover')) ?>");
      background-size:cover;
      background-repeat:no-repeat;
      /* backdrop-filter: contrast(1); -- ĐÃ XÓA ĐỂ DÙNG HIỆU ỨNG BLUR */
    }
    #page-title{
      text-shadow: 6px 4px 7px black;
      font-size: 3.5em;
      color: #fff4f4 !important;
      background: #8080801c;
    }

    /* === CSS CHO HIỆU ỨNG KÍNH MỜ (PHƯƠNG ÁN 2) === */
    .login-box .card {
        /* 1. Nền bán trong suốt */
        background: rgba(0, 0, 0, 0.25); /* Nền hơi tối, bạn có thể đổi thành 255, 255, 255 nếu thích sáng */
        
        /* 2. Hiệu ứng làm mờ */
        -webkit-backdrop-filter: blur(10px);
        backdrop-filter: blur(10px);
        
        /* 3. Viền nhẹ cho đẹp */
        border: 1px solid rgba(255, 255, 255, 0.2);
        border-radius: 10px; /* Bo góc nhiều hơn một chút */
    }

    /* Đổi màu chữ và link thành màu trắng cho dễ đọc */
    .login-box .card-body p,
    .login-box .card-body .col-8 a {
        color: #ffffff;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.7);
    }

    /* Làm mờ các ô input */
    .login-box .form-control {
        background: rgba(255, 255, 255, 0.3);
        border: 1px solid rgba(255, 255, 255, 0.5);
        color: #ffffff; /* Chữ khi gõ phím */
    }

    /* Đổi màu chữ placeholder (chữ mờ) */
    .login-box .form-control::placeholder {
      color: #eeeeee;
      opacity: 1;
    }

    /* Biểu tượng user/khóa */
    .login-box .input-group-text {
        background: rgba(255, 255, 255, 0.3);
        border: 1px solid rgba(255, 255, 255, 0.5);
        color: #ffffff;
    }
    /* === KẾT THÚC CSS PHƯƠNG ÁN 2 === */

  </style>
  <h1 class="text-center text-white px-4 py-5" id="page-title"><b><?php echo $_settings->info('name') ?></b></h1>
<div class="login-box">
  <div class="card card-primary my-2">
    <div class="card-body">
      <p class="login-box-msg">Please enter your credentials</p>
      <form id="login-frm" action="" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="username" autofocus placeholder="Username">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control"  name="password" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <a href="<?php echo base_url ?>">Go to Website</a>
          </div>
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
          </div>
          </div>
      </form>
      </div>
    </div>
  </div>
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="dist/js/adminlte.min.js"></script>

<script>
  $(document).ready(function(){
    end_loader();
  })
</script>
</body>
</html>