<style>
    .carousel-item>img{
        object-fit:fill !important;
    }
    #carouselExampleControls .carousel-inner{
        height:280px !important;
    }
    
    /* CSS MỚI CHO BESTSELLER */
    .product-item-wrapper {
        position: relative;
        overflow: hidden; /* Giúp nhãn đẹp hơn */
    }
    .bestseller-badge {
        position: absolute;
        top: 10px;
        left: -35px;
        background-color: #d9534f; /* Màu đỏ */
        color: white;
        padding: 5px 30px;
        transform: rotate(-45deg);
        font-size: 0.8rem;
        font-weight: bold;
        z-index: 10;
        box-shadow: 0 2px 3px rgba(0,0,0,0.3);
    }
    /* END CSS MỚI */
</style>
<?php 
// Lấy tất cả các tham số

// === START SỬA ĐỔI PHP ===
// Code cũ (dành cho mảng checkbox) đã bị xóa.
// Code mới: Lấy brand_id là một giá trị số duy nhất. 'b' là name của <select>
$brand_id = isset($_GET['b']) && is_numeric($_GET['b']) ? intval($_GET['b']) : 0;
// === END SỬA ĐỔI PHP ===

$sort = isset($_GET['sort']) ? $_GET['sort'] : 'default';
$min_price = isset($_GET['min_price']) && is_numeric($_GET['min_price']) ? floatval($_GET['min_price']) : null;
$max_price = isset($_GET['max_price']) && is_numeric($_GET['max_price']) ? floatval($_GET['max_price']) : null;


// --- BẮT ĐẦU XÂY DỰNG QUERY ---
// 1. Khởi tạo
$where_sql = " p.status = 1 ";

// 2. Xử lý Filter (Brands)
// === START SỬA ĐỔI SQL ===
// Code cũ (dùng "IN ($brand_ids)") đã bị xóa.
// Code mới: Lọc theo brand_id = giá trị, chỉ khi brand_id > 0 (không phải "All Brands")
if ($brand_id > 0) {
    $where_sql .= " AND p.brand_id = $brand_id ";
}
// === END SỬA ĐỔI SQL ===

// 3. Xử lý Filter (Price)
if ($min_price !== null) {
    $where_sql .= " AND p.price >= $min_price ";
}
if ($max_price !== null) {
    $where_sql .= " AND p.price <= $max_price ";
}

// 4. Xử lý Sort
switch ($sort) {
    case 'price_asc':
        $sort_sql = " ORDER BY p.price ASC ";
        break;
    case 'price_desc':
        $sort_sql = " ORDER BY p.price DESC ";
        break;
    case 'newest':
        $sort_sql = " ORDER BY p.date_created DESC ";
        break;
    default:
        $sort_sql = " ORDER BY p.name ASC "; // Mặc định sắp xếp theo tên
}

// 5. Câu lệnh SQL cuối cùng (Thêm subquery đếm 'total_sold')
$sql_query_string = "
    SELECT p.*, b.name as bname, 
           (SELECT SUM(ol.quantity) 
            FROM order_list ol 
            INNER JOIN orders o ON ol.order_id = o.id 
            WHERE ol.product_id = p.id AND o.status = 3) as total_sold
    FROM products p 
    INNER JOIN brands b ON p.brand_id = b.id 
    WHERE $where_sql 
    $sort_sql
";

// Thực thi Query
$products = $conn->query($sql_query_string);

// --- KẾT THÚC XÂY DỰNG QUERY ---
?>
<section class="py-0">
    <div class="container-fluid">
    <div class="row">
        <div class="col-lg-2 px-1 border-right text-sm position-sticky ">
            
            <form action="" method="GET" id="filter-form">
                
                <h4><b>Brands</b></h4>
                <div class.="form-group" style="padding: 0 10px;">
                    <select name="b" id="brand-select" class="form-control form-control-sm">
                        <option value="0" <?php echo ($brand_id == 0) ? "selected" : "" ?>>All Brands</option>
                        <?php 
                        $qry = $conn->query("SELECT * FROM brands where status =1 order by name asc");
                        while($row=$qry->fetch_assoc()):
                        ?>
                            <option value="<?php echo $row['id'] ?>" <?php echo ($brand_id == $row['id']) ? "selected" : "" ?>>
                                <?php echo $row['name'] ?>
                            </option>
                        <?php endwhile; ?>
                    </select>
                </div>
                <div class="card rounded-0 mt-3">
                    <div class="card-header">
                        <h5 class="mb-0">Filter by Price</h5>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="form-group mb-2" style="width: 48%;">
                                <label for="min_price" class="form-label small">Min</label>
                                <input type="number" class="form-control form-control-sm" id="min_price" name="min_price" 
                                    value="<?php echo isset($_GET['min_price']) ? htmlspecialchars($_GET['min_price']) : ''; ?>" 
                                    placeholder="$0">
                            </div>
                            <div class="form-group mb-2" style="width: 48%;">
                                <label for="max_price" class="form-label small">Max</label>
                                <input type="number" class="form-control form-control-sm" id="max_price" name="max_price" 
                                    value="<?php echo isset($_GET['max_price']) ? htmlspecialchars($_GET['max_price']) : ''; ?>" 
                                    placeholder="$10,000">
                            </div>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary w-100 mt-2">Apply Filters</button>

            </form> </div>
        <div class="col-lg-10 py-2">
            <div class="row">
                <div class="col-md-12">
                    <div id="carouselExampleControls" class="carousel slide bg-dark" data-ride="carousel">
                        <div class="carousel-inner">
                            <?php 
                                $upload_path = "uploads/banner";
                                if(is_dir(base_app.$upload_path)): 
                                $file= scandir(base_app.$upload_path);
                                $_i = 0;
                                    foreach($file as $img):
                                        if(in_array($img,array('.','..')))
                                            continue;
                                $_i++;
                                    
                            ?>
                            <div class="carousel-item h-100 <?php echo $_i == 1 ? "active" : '' ?>">
                                <img src="<?php echo validate_image($upload_path.'/'.$img) ?>" class="d-block w-100  h-100" alt="<?php echo $img ?>">
                            </div>
                            <?php endforeach; ?>
                            <?php endif; ?>
                        </div>
                        <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                        </div>
                </div>
            </div>

            <div class="row my-3 px-4 align-items-center">
                <div class="col-md-4">
                    <p class="text-muted mb-0">Showing <?php echo $products->num_rows ?> results</p>
                </div>
                <div class="col-md-4 offset-md-4">
                    <form action="" method="GET" id="sort-form">
                        <select class="form-select" name="sort" id="sort-select">
                            <option value="default" <?php echo $sort == 'default' ? 'selected' : ''; ?>>Default Sorting</option>
                            <option value="newest" <?php echo $sort == 'newest' ? 'selected' : ''; ?>>Sort by Newest</option>
                            <option value="price_asc" <?php echo $sort == 'price_asc' ? 'selected' : ''; ?>>Sort by Price: Low to High</option>
                            <option value="price_desc" <?php echo $sort == 'price_desc' ? 'selected' : ''; ?>>Sort by Price: High to Low</option>
                        </select>
                    </form>
                </div>
            </div>
            <div class="container px-4 px-lg-5 mt-2"> <div class="row gx-4 gx-lg-4 row-cols-md-3 row-cols-xl-4 ">
                    <?php 
                        // Câu query đã được chạy ở trên cùng
                        while($row = $products->fetch_assoc()):
                            $upload_path = base_app.'/uploads/product_'.$row['id'];
                            $img = "";
                            if(is_dir($upload_path)){
                                $fileO = scandir($upload_path);
                                if(isset($fileO[2]))
                                    $img = "uploads/product_".$row['id']."/".$fileO[2];
                            }
                            foreach($row as $k=> $v){
                                $row[$k] = trim(stripslashes($v));
                            }
                            $inventory = $conn->query("SELECT * FROM inventory where product_id = ".$row['id']);
                    ?>
                    <div class="col mb-5">
                        <div class="product-item-wrapper card h-100">
                            
                            <?php 
                            $total_sold = $row['total_sold'] ?? 0;
                            if ($total_sold > 5): // Đặt mốc 5 sản phẩm là bestseller
                            ?>
                                <div class="bestseller-badge">Bestseller</div>
                            <?php endif; ?>
                            <a class="text-dark" href=".?p=view_product&id=<?php echo md5($row['id']) ?>">
                                <img class="card-img-top w-100 book-cover" src="<?php echo validate_image($img) ?>" alt="..." />
                                <div class="card-body p-4">
                                    <div class="">
                                        <h5 class="fw-bolder"><?php echo $row['name'] ?></h5>
                                        <span><b>Price: </b>$<?php echo number_format($row['price'],2) ?></span>
                                    </div>
                                    <p class="m-0"><small><b>Brand:</b> <?php echo $row['bname'] ?></small></p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <?php endwhile; ?>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<script>
    // === START SỬA ĐỔI JAVASCRIPT ===
    // Toàn bộ code JavaScript cũ cho checkbox (hàm check_filter(), 
    // sự kiện #brandAll, sự kiện .brand-item) đã được XÓA BỎ 
    // vì chúng không còn cần thiết nữa.
    // === END SỬA ĐỔI JAVASCRIPT ===

    $(function(){
        // Xử lý khi nhấn sort dropdown
        $('#sort-select').change(function(){
            var sort_form = $('#sort-form');
            // Lấy URL hiện tại và các tham số
            var current_params = new URLSearchParams(window.location.search);
            
            // Xóa 'sort' cũ nếu có
            current_params.delete('sort');

            // Thêm tất cả tham số (b, min_price, max_price) làm hidden input
            current_params.forEach((value, key) => {
                // === SỬA ĐỔI JS (SORT) ===
                // Xóa logic if(key.includes('[]')) vì 'b' bây giờ là giá trị đơn,
                // không còn là mảng 'b[]' nữa.
                var input = $('<input>').attr('type', 'hidden').attr('name', key).val(value);
                sort_form.append(input);
                // === KẾT THÚC SỬA ĐỔI JS (SORT) ===
            });

            // Gửi form sort
            sort_form.submit();
        });

    })

</script>