<?php

session_start();
if (!isset($_SESSION{
  'username'})) {

  $_SESSION['message'] = "กรุณาล็อกอินก่อนใช้งานระบบ";
  header('location:login.php');
}
if (isset($_GET['logout'])) {
  session_destroy();
  unset($_SESSION['usermane']);
  header('location:login.php');
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title></title>
</head>

<body>

  <div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Add User</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form artion="insert.php" method="post">
            <div class="mb-3">
              <label for="firstname" class="col-form-label">ขื่อพนักงาน:</label>
              <input type="text" require class="form-control" id="firstname">
            </div>
            <div class="mb-3">
              <label for="lastname" class="col-form-label">นามสกุล:</label>
              <input type="text" require class="form-control" id="lastname"></input>
            </div>
            <div class="mb-3">
              <label for="birthday" class="col-form-label">ว/ด/ป เกิด:</label>
              <input type="text" require class="form-control" id="lastname"></input>
            </div>
            <div class="mb-3">
              <label for="birthday" class="col-form-label">ที่อยู่:</label>
              <input type="text" require class="form-control" id="lastname"></input>
            </div>
            <div class="mb-3">
              <label for="birthday" class="col-form-label">จังหวัด:</label>
              <input type="text" require class="form-control" id="lastname"></input>
            </div>
            <div class="mb-3">
              <label for="birthday" class="col-form-label">จังหวัด:</label>
              <input type="text" require class="form-control" id="lastname"></input>
            </div>
            <div class="mb-3">
              <label for="birthday" class="col-form-label">บริษัท:</label>
              <input type="text" require class="form-control" id="lastname"></input>
            </div>
            <div class="mb-3">
              <label for="birthday" class="col-form-label">สาขาน:</label>
              <input type="text" require class="form-control" id="lastname"></input>
            </div>
            <div class="mb-3">
              <label for="birthday" class="col-form-label">เงินเดือน:</label>
              <input type="text" require class="form-control" id="lastname"></input>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" name="submit" class="btn btn-primary">บันทึก</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>




  <main>
    <nav class="py-2 bg-body-tertiary border-bottom">
      <div class="container d-flex flex-wrap">
        <ul class="nav me-auto">
          <li class="nav-item"><a href="#" class="nav-link link-dark px-2 active" aria-current="page">ข้อมูลพนักงาน</a>
          </li>
          <li class="nav-item"><a href="#" class="nav-link link-dark px-2">อนุมัติการลา </a></li>
          <li class="nav-item"><a href="#" class="nav-link link-dark px-2">รายการการลางานประจำปี</a></li>
          <li class="nav-item"><a href="#" class="nav-link link-dark px-2">รายงานการเข้า-ออกงาน</a></li>
          <li class="nav-item"><a href="#" class="nav-link link-dark px-2">รายงานการเข้างานสาย</a></li>
          <li class="nav-item"><a href="HR.php" class="nav-link link-dark px-2">หน้าหลัก</a></li>
        </ul>

        <ul class="nav">
          <li class="nav-item"><a href="#" class="nav-link link-dark px-2">สวัสดี
              <?php echo $_SESSION['login_Name'] ?></a></li>
          <li class="nav-item"><a href="HR.php?logout='1'" class="nav-link link-dark px-2">ออกจากระบบ</a></li>
        </ul>
      </div>
    </nav>
  </main>
  <?php
  require('connect.php');
  date_default_timezone_set('asia/bangkok');
  $date = date('Y-m-d');
  $dateshow = date('d-m-Y');
  $search_date_text = date('Y-m-d', strtotime($date));

  //$sql = "SELECT * FROM `employee`";
  //$objQuery = mysqli_query($conn, $sql) or die("Error Query [" . $sql . "]");
  $empp = $conn->query("SELECT * FROM `employee` ");
  $empp->execute();
  $users = $empp->fetchAll();

  ?>

  <div class="container">
    <div class="row">
      <div class="col-11 bg-light p-9 border">
        <table class="table">
          <thead>
            <tr>
              <th colspan="7"> รายชื่อพนักงาน ณ วันที่ <?php echo $dateshow; ?></th>

            </tr>
            <th>รหัสพนักงาน</th>
            <th>ซื้อ</th>
            <th>นามสกุล</th>
            <th>บริษัท</th>
            <th>สาขา</th>
            <th>แก้ไข</th>
            <th>ลบข้อมูล</th>
          </thead>

          <tbody>
            <?php
            if (!$users) {
              echo "<tr><td colspan='6'class'text center'>ไม่พบข้อมูล</td> </tr>";
            } else {
              foreach ($users as $user) {
            ?>
                <tr>
                  <td><?= $user['emp_code']; ?></td>
                  <td><?= $user['emp_first_name']; ?></td>
                  <td><?= $user['emp_last_name']; ?></td>
                  <td><?= $user['emp_company_id']; ?></td>
                  <td><?= $user['emp_branch_id']; ?></td>
                  <td><button type="button" value='edit' class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#useredit">แก้ไข</button></a></td>
                  <td><button type="button" value='delete' class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#userdelete">ลบ</button></a></td>
                </tr>
            <?php
              }
            }
            ?>
            <th colspan="7">
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#userModal">เพิ่มข้อมูลพนักงาน</button>
            </th>
          </tbody>
        </table>

      </div>


      <?php
      // ปิดฐานข้อมูล
      $conn = null;
      ?>


      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>

</html>