<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">

                <div class="sb-sidenav-menu-heading">Core</div>
                <a class="nav-link" href="dashboard.php">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div> Dashboard
                </a>

                <div class="sb-sidenav-menu-heading">Product Management</div>

                <!-- Categories -->
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#categoriesMenu">
                    <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div> Categories
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="categoriesMenu" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="add-category.php">Add</a>
                        <a class="nav-link" href="manage-categories.php">Manage</a>
                    </nav>
                </div>

                <!-- Sub-Categories -->
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#subCategoriesMenu">
                    <div class="sb-nav-link-icon"><i class="fas fa-layer-group"></i></div> Sub-Categories
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="subCategoriesMenu" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="add-subcategories.php">Add</a>
                        <a class="nav-link" href="manage-subcategories.php">Manage</a>
                    </nav>
                </div>

                <!-- Products -->
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#productsMenu">
                    <div class="sb-nav-link-icon"><i class="fas fa-box"></i></div> Products
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="productsMenu" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="add-product.php">Add</a>
                        <a class="nav-link" href="manage-products.php">Manage</a>
                    </nav>
                </div>

                <div class="sb-sidenav-menu-heading">Order Management</div>

                <!-- Orders -->
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#ordersMenu">
                    <div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div> Orders
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="ordersMenu" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <?php 
                            $ret = mysqli_query($con, "SELECT 
                                COUNT(id) AS totalorders,
                                COUNT(IF(orderStatus='' OR orderStatus IS NULL, 1, NULL)) AS neworders,
                                COUNT(IF(orderStatus='Packed', 1, NULL)) AS packedorders,
                                COUNT(IF(orderStatus='Dispatched', 1, NULL)) AS dispatchedorders,
                                COUNT(IF(orderStatus='In Transit', 1, NULL)) AS intransitorders,
                                COUNT(IF(orderStatus='Out For Delivery', 1, NULL)) AS outfordelivery,
                                COUNT(IF(orderStatus='Delivered', 1, NULL)) AS deliveredorders,
                                COUNT(IF(orderStatus='Cancelled', 1, NULL)) AS cancelledorders
                                FROM orders");
                            $results = mysqli_fetch_assoc($ret);
                        ?>
                        <a class="nav-link" href="all-orders.php">All Orders <span class="badge bg-light text-dark ms-2"><?php echo $results['totalorders']; ?></span></a>
                        <a class="nav-link" href="new-order.php">New Orders <span class="badge bg-primary ms-2"><?php echo $results['neworders']; ?></span></a>
                        <a class="nav-link" href="packed-orders.php">Packed Orders <span class="badge bg-info ms-2"><?php echo $results['packedorders']; ?></span></a>
                        <a class="nav-link" href="dispatched-orders.php">Dispatched Orders <span class="badge bg-warning ms-2"><?php echo $results['dispatchedorders']; ?></span></a>
                        <a class="nav-link" href="intransit-orders.php">In Transit Orders <span class="badge bg-secondary ms-2"><?php echo $results['intransitorders']; ?></span></a>
                        <a class="nav-link" href="outfordelivery-orders.php">Out for Delivery Orders <span class="badge bg-dark ms-2"><?php echo $results['outfordelivery']; ?></span></a>
                        <a class="nav-link" href="delivered-orders.php">Delivered Orders <span class="badge bg-success ms-2"><?php echo $results['deliveredorders']; ?></span></a>
                        <a class="nav-link" href="cancelled-orders.php">Cancelled Orders <span class="badge bg-danger ms-2"><?php echo $results['cancelledorders']; ?></span></a>
                    </nav>
                </div>

                <div class="sb-sidenav-menu-heading">Reports</div>

                <!-- Reports -->
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#reportsMenu">
                    <div class="sb-nav-link-icon"><i class="fas fa-chart-line"></i></div> Reports
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="reportsMenu" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="bwdates-ordersreport.php">B/W Dates Orders Report</a>
                        <a class="nav-link" href="sales-report.php">Sales Report</a>
                    </nav>
                </div>

                <a class="nav-link" href="registered-users.php">
                    <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div> Registered Users
                </a>

            </div>
        </div>

        <!-- Footer -->
        <div class="sb-sidenav-footer">
            <div class="small">Logged in as:</div>
            <strong><?php echo $_SESSION['alogin']; ?></strong>
        </div>
    </nav>
</div>
