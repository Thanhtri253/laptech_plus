<?php 
// File config của bạn đã được gọi từ index.php
require_once('../config.php'); 

// --- PHẦN PHP LẤY DỮ LIỆU (Đã nâng cấp) ---
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

// 4. THÔNG SỐ MỚI: Recent Orders (5 đơn hàng mới nhất)
$recent_orders_query = "
    SELECT o.*, c.firstname, c.lastname 
    FROM `orders` o 
    INNER JOIN `clients` c ON c.id = o.client_id 
    ORDER BY o.date_created DESC 
    LIMIT 5
";
$recent_orders = $conn->query($recent_orders_query);

// 5. THÔNG SỐ MỚI: Best Selling Products (Top 5)
$bestselling_query = "
    SELECT p.name, SUM(ol.quantity) as total_sold
    FROM `order_list` ol
    INNER JOIN `products` p ON p.id = ol.product_id
    INNER JOIN `orders` o ON o.id = ol.order_id
    WHERE o.status = 3 -- Chỉ tính đơn đã giao
    GROUP BY p.name
    ORDER BY total_sold DESC
    LIMIT 5
";
$bestselling_products = $conn->query($bestselling_query);

?>

<h1>Dashboard</h1>

<div class="row">
    <div class="col-lg-3 col-6">
        <div class="small-box bg-info">
            <div class="inner">
                <h3>$<?php echo number_format($total_sales ?? 0); ?></h3>
                <p>Total Revenue</p>
            </div>
            <div class="icon">
                <i class="fas fa-dollar-sign"></i>
            </div>
            <a href="<?php echo base_url ?>admin/?page=sales" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
    </div>
    
    <div class="col-lg-3 col-6">
        <div class="small-box bg-success">
            <div class="inner">
                <h3><?php echo $total_orders ?? 0; ?></h3>
                <p>Total Orders</p>
            </div>
            <div class="icon">
                <i class="fas fa-shopping-cart"></i>
            </div>
            <a href="<?php echo base_url ?>admin/?page=orders" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
    </div>
    
    <div class="col-lg-3 col-6">
        <div class="small-box bg-warning">
            <div class="inner">
                <h3><?php echo $total_clients ?? 0; ?></h3>
                <p>Customers</p>
            </div>
            <div class="icon">
                <i class="fas fa-users"></i>
            </div>
            <a href="<?php echo base_url ?>admin/?page=clients" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
    </div>

    <div class="col-lg-3 col-6">
        <div class="small-box bg-danger">
            <div class="inner">
                <h3><?php echo $total_products ?? 0; ?></h3>
                <p>Products</p>
            </div>
            <div class="icon">
                <i class="fas fa-laptop"></i>
            </div>
            <a href="<?php echo base_url ?>admin/?page=product" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
    </div>
</div>

<div class="row mt-2">
    <div class="col-lg-7">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Revenue (Last 7 Days)</h3>
            </div>
            <div class="card-body">
                <canvas id="salesChart"></canvas>
            </div>
        </div>
    </div>
    
    <div class="col-lg-5">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Order Status Breakdown</h3>
            </div>
            <div class="card-body">
                <canvas id="orderStatusChart"></canvas>
            </div>
        </div>
    </div>
</div>

<div class="row mt-2">
    <div class="col-lg-7">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Recent Orders</h3>
            </div>
            <div class="card-body p-0">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px">ID</th>
                            <th>Customer</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while($row = $recent_orders->fetch_assoc()): ?>
                        <tr>
                            <td><a href="<?php echo base_url ?>admin/?page=orders/view_order&id=<?php echo $row['id'] ?>"><?php echo $row['id'] ?></a></td>
                            <td><?php echo $row['firstname'] . ' ' . $row['lastname'] ?></td>
                            <td>$<?php echo number_format($row['amount']) ?></td>
                            <td>
                                <?php 
                                    switch ($row['status']) {
                                        case 0: echo '<span class="badge bg-warning">Pending</span>'; break;
                                        case 1: echo '<span class="badge bg-info">Confirmed</span>'; break;
                                        case 2: echo '<span class="badge bg-primary">Packed</span>'; break;
                                        case 3: echo '<span class="badge bg-success">Delivered</span>'; break;
                                        default: echo '<span class="badge bg-danger">Cancelled</span>'; break;
                                    }
                                ?>
                            </td>
                            <td><?php echo date("d-m-Y", strtotime($row['date_created'])) ?></td>
                        </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-lg-5">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Best Selling Products</h3>
            </div>
            <div class="card-body">
                <ul class="products-list product-list-in-card pl-2 pr-2">
                    <?php while($row = $bestselling_products->fetch_assoc()): ?>
                    <li class="item">
                        <div class="product-info">
                            <span class="product-title"><?php echo $row['name'] ?></span>
                            <span class="badge badge-success float-right"><?php echo $row['total_sold'] ?> Sold</span>
                        </div>
                    </li>
                    <?php endwhile; ?>
                </ul>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
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
                options: { 
                    scales: { y: { beginAtZero: true } }, 
                    responsive: true,
                    maintainAspectRatio: false
                }
            });
        }

        var statusCtx = document.getElementById('orderStatusChart');
        if (statusCtx) {
            new Chart(statusCtx.getContext('2d'), {
                type: 'doughnut', // Đây là biểu đồ tròn
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
                options: { 
                    responsive: true,
                    maintainAspectRatio: false
                }
            });
        }
    });
</script>