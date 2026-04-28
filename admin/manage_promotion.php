<?php 
// require_once('../config.php'); // Đã gọi từ index.php

$promo = [
    'id' => null, 'code' => '', 'description' => '', 'type' => 'percent', 'value' => 0,
    'max_uses' => 100, 'start_date' => date('Y-m-d\TH:i'),
    'end_date' => date('Y-m-d\TH:i', strtotime('+7 days')), 'status' => 1
];
$page_title = "Add New Promotion";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'] ?? null;
    $code = $conn->real_escape_string($_POST['code']);
    $description = $conn->real_escape_string($_POST['description']);
    $type = $conn->real_escape_string($_POST['type']);
    $value = floatval($_POST['value']);
    $max_uses = intval($_POST['max_uses']);
    $start_date = $conn->real_escape_string($_POST['start_date']);
    $end_date = $conn->real_escape_string($_POST['end_date']);
    $status = intval($_POST['status']);

    if (!empty($id)) {
        $sql = "UPDATE promotions SET 
                    code = '$code', description = '$description', type = '$type', 
                    value = $value, max_uses = $max_uses, start_date = '$start_date', 
                    end_date = '$end_date', status = $status 
                WHERE id = $id";
    } else {
        $sql = "INSERT INTO promotions (code, description, type, value, max_uses, start_date, end_date, status) 
                VALUES ('$code', '$description', '$type', $value, $max_uses, '$start_date', '$end_date', $status)";
    }
    if ($conn->query($sql) === TRUE) {
        // Sửa header: chuyển hướng về ?page=promotions
        echo "<script>location.replace('?page=promotions');</script>";
        exit;
    } else {
        echo "Error: " . $sql . "<br>"."<pre>{$sql}</pre>" . $conn->error;
    }
}

// Sửa logic: lấy id từ $_GET['id'] (do index.php truyền vào)
if (isset($_GET['id']) && !empty($_GET['id'])) {
    $id = intval($_GET['id']);
    $result = $conn->query("SELECT * FROM promotions WHERE id = $id");
    if ($result->num_rows > 0) {
        $promo = $result->fetch_assoc();
        $promo['start_date'] = date('Y-m-d\TH:i', strtotime($promo['start_date']));
        $promo['end_date'] = date('Y-m-d\TH:i', strtotime($promo['end_date']));
        $page_title = "Edit Promotion";
    }
}
// Không $conn->close()
?>

<h1><?php echo $page_title; ?></h1>

<form action="?page=manage_promotion<?php echo isset($promo['id']) ? '&id='.$promo['id'] : ''; ?>" method="POST" class="mt-4 p-4 bg-white rounded shadow-sm">
    <?php if (!empty($promo['id'])): ?>
        <input type="hidden" name="id" value="<?php echo $promo['id']; ?>">
    <?php endif; ?>

    <div class="mb-3">
        <label for="code" class="form-label">Discount Code</label>
        <input type="text" class="form-control" id="code" name="code" value="<?php echo htmlspecialchars($promo['code']); ?>" required>
    </div>
    
    <div class="mb-3">
        <label for="description" class="form-label">Description</label>
        <textarea class="form-control" id="description" name="description" rows="3"><?php echo htmlspecialchars($promo['description']); ?></textarea>
    </div>
    
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="type" class="form-label">Discount Type</label>
            <select class="form-select" id="type" name="type">
                <option value="percent" <?php echo ($promo['type'] == 'percent') ? 'selected' : ''; ?>>Percent Discount (%)</option>
                <option value="fixed" <?php echo ($promo['type'] == 'fixed') ? 'selected' : ''; ?>>Fixed Amount Discount ($)</option>
            </select>
        </div>
        <div class="col-md-6 mb-3">
            <label for="value" class="form-label">Value (e.g., 10 for 10% or 50 for $50)</label>
            <input type="number" class="form-control" id="value" name="value" value="<?php echo $promo['value']; ?>" required>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="start_date" class="form-label">Start Date</label>
            <input type="datetime-local" class="form-control" id="start_date" name="start_date" value="<?php echo $promo['start_date']; ?>" required>
        </div>
        <div class="col-md-6 mb-3">
            <label for="end_date" class="form-label">End Date</label>
            <input type="datetime-local" class="form-control" id="end_date" name="end_date" value="<?php echo $promo['end_date']; ?>" required>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="max_uses" class="form-label">Maximum Uses</label>
            <input type="number" class="form-control" id="max_uses" name="max_uses" value="<?php echo $promo['max_uses']; ?>" required>
        </div>
        <div class="col-md-6 mb-3">
            <label for="status" class="form-label">Status</label>
            <select class="form-select" id="status" name="status">
                <option value="1" <?php echo ($promo['status'] == 1) ? 'selected' : ''; ?>>Active</option>
                <option value="0" <?php echo ($promo['status'] == 0) ? 'selected' : ''; ?>>Inactive</option>
            </select>
        </div>
    </div>
    
    <button type="submit" class="btn btn-primary">Save</button>
    <a href="?page=promotions" class="btn btn-secondary">Cancel</a>
</form>