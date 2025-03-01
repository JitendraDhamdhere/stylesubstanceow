<?php
session_start();
include('include/config.php');

if (strlen($_SESSION['alogin']) == 0) {
    header('location:index.php');
} else {
    date_default_timezone_set('Asia/Kolkata');
    $currentTime = date('d-m-Y h:i:s A', time());

    // Handle search request
    if (isset($_POST['search'])) {
        $_SESSION['fromDate'] = $_POST['fromDate'];
        $_SESSION['toDate'] = $_POST['toDate'];
        header("Location: manage-reports.php"); // Redirect to prevent form resubmission
        exit();
    }
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin | Manage Reports</title>
    <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link type="text/css" href="css/theme.css" rel="stylesheet">
    <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
    <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
    
    <!-- Custom Print Styles -->
    <style>
        @media print {
            body * {
                visibility: hidden;
            }
            #printSection, #printSection * {
                visibility: visible;
            }
            #printSection {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <?php include('include/header.php'); ?>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <?php include('include/sidebar.php'); ?>
                <div class="span9">
                    <div class="content">
                        <div class="module">
                            <div class="module-head">
                                <h3>Search Reports</h3>
                            </div>
                            <div class="module-body">
                                <form method="post" class="form-horizontal row-fluid">
                                    <div class="control-group">
                                        <label class="control-label">From Date:</label>
                                        <div class="controls">
                                            <input type="date" name="fromDate" required class="span4">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">To Date:</label>
                                        <div class="controls">
                                            <input type="date" name="toDate" required class="span4">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="controls">
                                            <button type="submit" name="search" class="btn btn-primary">Search</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <?php
                        if (isset($_SESSION['fromDate']) && isset($_SESSION['toDate'])) {
                            $fromDate = $_SESSION['fromDate'] . " 00:00:00";
                            $toDate = $_SESSION['toDate'] . " 23:59:59";

                            $query = mysqli_query($con, "SELECT orders.*, users.name, users.email, products.productName 
                                FROM orders 
                                JOIN users ON orders.userId = users.id 
                                JOIN products ON orders.productId = products.id 
                                WHERE orderDate BETWEEN '$fromDate' AND '$toDate'");

                            if (!$query) {
                                die("Query failed: " . mysqli_error($con)); // Debugging statement
                            }
                        ?>

                        <div class="module">
                            <div class="module-head">
                                <h3>Report Results</h3>
                            </div>
                            <div class="module-body table">
                                <!-- Print Button -->
                                <button class="btn btn-success" onclick="printReport()">Print Report</button>
                                
                                <div id="printSection">
                                    <h2>Report from <?php echo htmlentities($_SESSION['fromDate']); ?> to <?php echo htmlentities($_SESSION['toDate']); ?></h2>
                                    <table class="datatable-1 table table-bordered table-striped display" width="100%">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Order ID</th>
                                                <th>User Name</th>
                                                <th>Email</th>
                                                <th>Product</th>
                                                <th>Quantity</th>
                                                <th>Order Date</th>
                                                <th>Payment Method</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $cnt = 1;
                                            while ($row = mysqli_fetch_array($query)) { ?>
                                                <tr>
                                                    <td><?php echo htmlentities($cnt); ?></td>
                                                    <td><?php echo htmlentities($row['id']); ?></td>
                                                    <td><?php echo htmlentities($row['name']); ?></td>
                                                    <td><?php echo htmlentities($row['email']); ?></td>
                                                    <td><?php echo htmlentities($row['productName']); ?></td>
                                                    <td><?php echo htmlentities($row['quantity']); ?></td>
                                                    <td><?php echo htmlentities($row['orderDate']); ?></td>
                                                    <td><?php echo htmlentities($row['paymentMethod']); ?></td>
                                                    <td><?php echo htmlentities($row['orderStatus']); ?></td>
                                                </tr>
                                            <?php $cnt++; } ?>
                                        </tbody>
                                    </table>
                                </div> <!-- End Print Section -->
                            </div>
                        </div>

                        <?php } ?> <!-- End of report display -->

                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php include('include/footer.php'); ?>
    <script src="scripts/jquery-1.9.1.min.js"></script>
    <script src="scripts/jquery-ui-1.10.1.custom.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="scripts/datatables/jquery.dataTables.js"></script>
    
    <script>
        $(document).ready(function () {
            $('.datatable-1').dataTable();
        });

        function printReport() {
            window.print();
        }
    </script>
</body>
</html>
<?php } ?>
