<?php 
// require_once('../config.php'); // Đã gọi từ index.php

if (isset($_GET['delete_id'])) {
    $id = $_GET['delete_id'];
    if($id != 1) { // Prevent deleting Super Admin
        $conn->query("DELETE FROM staffs WHERE id = $id");
    }
    // Sửa header: chuyển hướng về ?page=staffs
    echo "<script>location.replace('?page=staffs');</script>";
    exit;
}

$staffs = $conn->query("SELECT s.*, r.name as role_name FROM staffs s LEFT JOIN roles r ON s.role_id = r.id ORDER BY s.date_added DESC");
?>

<div class="d-flex justify-content-between align-items-center">
    <h1>Staff Management</h1>
    <a href="?page=manage_staff" class="btn btn-primary">Add Staff Member</a>
</div>

<table class="table table-striped table-bordered mt-4">
    <thead class="table-dark">
        <tr>
            <th>Full Name</th>
            <th>Username</th>
            <th>Role</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <?php while($row = $staffs->fetch_assoc()): ?>
        <tr>
            <td><?php echo $row['firstname'] . ' ' . $row['lastname']; ?></td>
            <td><?php echo $row['username']; ?></td>
            <td><span class="badge bg-info"><?php echo $row['role_name']; ?></span></td>
            <td>
                <?php if($row['status'] == 1): ?>
                    <span class="badge bg-success">Active</span>
                <?php else: ?>
                    <span class="badge bg-danger">Inactive</span>
                <?php endif; ?>
            </td>
            <td>
                <a href="?page=manage_staff&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-success">Edit</a>
                <?php if($row['id'] != 1): // Prevent deleting Super Admin ?>
                 <a href="?page=staffs&delete_id=<?php echo $row['id']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this?')">Delete</a>
                <?php endif; ?>
            </td>
        </tr>
        <?php endwhile; ?>
    </tbody>
</table>