<?php 
// File config của bạn đã được gọi từ index.php, 
// nhưng để an toàn, chúng ta có thể gọi lại ở đây
// nếu file config của bạn có cơ chế "require_once".
// Nếu gây lỗi "cannot redeclare", hãy xóa dòng dưới.
require_once('../config.php'); 

// --- PHẦN PHP LẤY DỮ LIỆU ---
// 1. Overview Stats
$total_sales = $conn->query("SELECT SUM(total_amount) as total FROM sales")->fetch_assoc()['total'];
$total_orders = $conn->query("SELECT COUNT(id) as total FROM orders")->fetch_assoc()['total'];
$total_clients = $conn->query("SELECT COUNT(id) as total FROM clients")->fetch_assoc()['total'];
$total_products = $conn->query("SELECT COUNT(id) as total FROM products")->fetch_assoc()['total'];

// 2. Data for Doughnut Chart (Order Status)
$status_query = $conn->query("
    SELECT 
        CASE 
            WHEN status = 0 THEN 'Pending'
            WHEN status = 1 THEN 'Confirmed'
            WHEN status = 2 THEN 'Packed'
            WHEN status = 3 THEN 'Delivered'
            ELSE 'Cancelled'
        END as status_label,
        COUNT(id) as total
    FROM orders
    GROUP BY status
");
$order_status_labels = [];
$order_status_data = [];
while($row = $status_query->fetch_assoc()){
    $order_status_labels[] = $row['status_label'];
    $order_status_data[] = $row['total'];
}

// 3. Data for Bar Chart (Sales last 7 days)
$sales_query = $conn->query("
    SELECT 
        DATE(date_created) as sale_date,
        SUM(total_amount) as daily_total
    FROM sales
    WHERE date_created >= CURDATE() - INTERVAL 7 DAY
    GROUP BY DATE(date_created)
    ORDER BY sale_date ASC
");
$daily_sales_labels = [];
$daily_sales_data = [];
while($row = $sales_query->fetch_assoc()){
    $daily_sales_labels[] = $row['sale_date'];
    $daily_sales_data[] = $row['daily_total'];
}
// Không $conn->close() ở đây, vì file footer.php có thể cần nó
?>

<style>
    .stat-card { background: white; border-radius: 8px; padding: 20px; margin-bottom: 20px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
    .chart-container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
</style>

<h1>Dashboard</h1>

<div class="row">
    <div class="col-md-3">
        <div class="stat-card">
            <h5>Total Revenue</h5>
            <h3>$<?php echo number_format($total_sales ?? 0); ?></h3>
        </div>
    </div>
    <div class="col-md-3">
        <div class="stat-card">
            <h5>Total Orders</h5>
            <h3><?php echo $total_orders ?? 0; ?></h3>
        </div>
    </div>
    <div class="col-md-3">
        <div class="stat-card">
            <h5>Customers</h5>
            <h3><?php echo $total_clients ?? 0; ?></h3>
        </div>
    </div>
    <div class="col-md-3">
        <div class="stat-card">
            <h5>Products</h5>
            <h3><?php echo $total_products ?? 0; ?></h3>
        </div>
    </div>
</div>

<div class="row mt-4">
    <div class="col-md-8">
        <div class="chart-container">
            <h5>Revenue (Last 7 Days)</h5>
            <canvas id="salesChart"></canvas>
        </div>
    </div>
    <div class="col-md-4">
        <div class="chart-container">
            <h5>Order Status</h5>
            <canvas id="orderStatusChart"></canvas>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Đảm bảo code chạy sau khi DOM được tải
    document.addEventListener("DOMContentLoaded", function() {
        // --- Biểu đồ Cột: Doanh thu ---
        var salesCtx = document.getElementById('salesChart');
        if (salesCtx) {
            new Chart(salesCtx.getContext('2d'), {
                type: 'bar',
                data: {
                    labels: <?php echo json_encode($daily_sales_labels); ?>,
                    datasets: [{
                        label: 'Revenue',
                        data: <?php echo json_encode($daily_sales_data); ?>,
                        backgroundColor: 'rgba(0, 123, 255, 0.5)',
                        borderColor: 'rgba(0, 123, 255, 1)',
                        borderWidth: 1
                    }]
                },
                options: { scales: { y: { beginAtZero: true } }, responsive: true }
            });
        }

        // --- Biểu đồ Tròn: Trạng thái đơn hàng ---
        var statusCtx = document.getElementById('orderStatusChart');
        if (statusCtx) {
            new Chart(statusCtx.getContext('2d'), {
                type: 'doughnut',
                data: {
                    labels: <?php echo json_encode($order_status_labels); ?>,
                    datasets: [{
                        label: 'Count',
                        data: <?php echo json_encode($order_status_data); ?>,
                        backgroundColor: [
                            'rgba(255, 159, 64, 0.7)', // Pending
                            'rgba(0, 123, 255, 0.7)', // Confirmed
                            'rgba(40, 167, 69, 0.7)', // Packed
                            'rgba(23, 162, 184, 0.7)', // Delivered
                            'rgba(220, 53, 69, 0.7)'  // Cancelled
                        ],
                        hoverOffset: 4
                    }]
                },
                options: { responsive: true }
            });
        }
    });
</script>