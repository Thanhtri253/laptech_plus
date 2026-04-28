<?php 
// require_once('../config.php'); // Đã gọi từ index.php

$staff = [
    'id' => null, 'firstname' => '', 'lastname' => '', 'username' => '',
    'role_id' => 3, 'status' => 1
];
$page_title = "Add New Staff Member";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'] ?? null;
    $firstname = $conn->real_escape_string($_POST['firstname']);
    $lastname = $conn->real_escape_string($_POST['lastname']);
    $username = $conn->real_escape_string($_POST['username']);
    $role_id = intval($_POST['role_id']);
    $status = intval($_POST['status']);
    
    $password_sql = "";
    if (!empty($_POST['password'])) {
        $hashed_password = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $password_sql = ", password = '$hashed_password'";
    }

    if (!empty($id)) {
        $role_status_sql = "";
        if($id != 1) { // Don't allow changing role/status for ID 1
             $role_status_sql = "role_id = $role_id, status = $status,";
        }
        
        $sql = "UPDATE staffs SET 
                    $role_status_sql
                    firstname = '$firstname', lastname = '$lastname', username = '$username'
                    $password_sql 
                WHERE id = $id";
    } else {
        if (empty($_POST['password'])) {
            die("Error: Password is required when creating a new staff member.");
        }
        $hashed_password = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $sql = "INSERT INTO staffs (firstname, lastname, username, password, role_id, status) 
                VALUES ('$firstname', '$lastname', '$username', '$hashed_password', $role_id, $status)";
    }

    if ($conn->query($sql) === TRUE) {
        // Sửa header: chuyển hướng về ?page=staffs
        echo "<script>location.replace('?page=staffs');</script>";
        exit;
    } else {
        echo "Error: " . $sql . "<br>"."<pre>{$sql}</pre>" . $conn->error;
    }
}

// Sửa logic: lấy id từ $_GET['id']
if (isset($_GET['id']) && !empty($_GET['id'])) {
    $id = intval($_GET['id']);
    $result = $conn->query("SELECT * FROM staffs WHERE id = $id");
    if ($result->num_rows > 0) {
        $staff = $result->fetch_assoc();
        $page_title = "Edit Staff Member";
    }
}

$roles_result = $conn->query("SELECT * FROM roles");
// Không $conn->close()
?>

<h1><?php echo $page_title; ?></h1>

<form action="?page=manage_staff<?php echo isset($staff['id']) ? '&id='.$staff['id'] : ''; ?>" method="POST" class="mt-4 p-4 bg-white rounded shadow-sm">
    <?php if (!empty($staff['id'])): ?>
        <input type="hidden" name="id" value="<?php echo $staff['id']; ?>">
    <?php endif; ?>

    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="firstname" class="form-label">First Name</label>
            <input type="text" class="form-control" id="firstname" name="firstname" value="<?php echo htmlspecialchars($staff['firstname']); ?>" required>
        </div>
        <div class="col-md-6 mb-3">
            <label for="lastname" class="form-label">Last Name</label>
            <input type="text" class="form-control" id="lastname" name="lastname" value="<?php echo htmlspecialchars($staff['lastname']); ?>" required>
        </div>
    </div>

    <div class="mb-3">
        <label for="username" class="form-label">Username (Login Name)</label>
        <input type="text" class="form-control" id="username" name="username" value="<?php echo htmlspecialchars($staff['username']); ?>" required>
    </div>
    
    <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" name="password" <?php echo empty($staff['id']) ? 'required' : ''; ?>>
        <?php if (!empty($staff['id'])): ?>
            <div class="form-text">Leave blank if you do not want to change the password.</div>
        <?php endif; ?>
    </div>
    
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="role_id" class="form-label">Role</label>
            <select class="form-select" id="role_id" name="role_id" <?php echo ($staff['id'] == 1) ? 'disabled' : ''; ?>>
                <?php while($role = $roles_result->fetch_assoc()): ?>
                <option value="<?php echo $role['id']; ?>" <?php echo ($staff['role_id'] == $role['id']) ? 'selected' : ''; ?>>
                    <?php echo htmlspecialchars($role['name']); ?>
                </option>
                <?php endwhile; ?>
            </select>
            <?php if ($staff['id'] == 1): ?>
                <div class="form-text text-danger">Cannot change the role of Super Admin.</div>
            <?php endif; ?>
        </div>
        <div class="col-md-6 mb-3">
            <label for="status" class="form-label">Status</label>
            <select class="form-select" id="status" name="status" <?php echo ($staff['id'] == 1) ? 'disabled' : ''; ?>>
                <option value="1" <?php echo ($staff['status'] == 1) ? 'selected' : ''; ?>>Active</option>
                <option value="0" <?php echo ($staff['status'] == 0) ? 'selected' : ''; ?>>Inactive</option>
            </select>
             <?php if ($staff['id'] == 1): ?>
                <div class="form-text text-danger">Cannot deactivate the Super Admin.</div>
            <?php endif; ?>
        </div>
    </div>
    
    <button type="submit" class="btn btn-primary">Save</button>
    <a href="?page=staffs" class="btn btn-secondary">Cancel</a>
</form>