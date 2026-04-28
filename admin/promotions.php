<?php 
// require_once('../config.php'); // Đã gọi từ index.php

if (isset($_GET['delete_id'])) {
    $id = $_GET['delete_id'];
    $conn->query("DELETE FROM promotions WHERE id = $id");
    // Sửa header: chuyển hướng về ?page=promotions
    echo "<script>location.replace('?page=promotions');</script>";
    exit;
}

$promotions = $conn->query("SELECT * FROM promotions ORDER BY date_created DESC");
?>

<div class="d-flex justify-content-between align-items-center">
    <h1>Promotion Management</h1>
    <a href="?page=manage_promotion" class="btn btn-primary">Add Promotion</a>
</div>

<table class="table table-striped table-bordered mt-4">
    <thead class="table-dark">
        <tr>
            <th>Code</th>
            <th>Description</th>
            <th>Type</th>
            <th>Value</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <?php while($row = $promotions->fetch_assoc()): ?>
        <tr>
            <td><?php echo $row['code']; ?></td>
            <td><?php echo $row['description']; ?></td>
            <td><?php echo $row['type']; ?></td>
            <td><?php echo ($row['type'] == 'percent') ? $row['value'] . '%' : '$' . number_format($row['value']); ?></td>
            <td><?php echo date('Y-m-d H:i', strtotime($row['start_date'])); ?></td>
            <td><?php echo date('Y-m-d H:i', strtotime($row['end_date'])); ?></td>
            <td>
                <?php if($row['status'] == 1): ?>
                    <span class="badge bg-success">Active</span>
                <?php else: ?>
                    <span class="badge bg-danger">Inactive</span>
                <?php endif; ?>
            </td>
            <td>
                <a href="?page=manage_promotion&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-success">Edit</a>
                <a href="?page=promotions&delete_id=<?php echo $row['id']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this?')">Delete</a>
            </td>
        </tr>
        <?php endwhile; ?>
    </tbody>
</table>