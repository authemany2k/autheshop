<?php
/*
* Author: Rohit Kumar
* Website: iamrohit.in
* Date: 09-03-2016
* App Name: Star rating system
* Description: Star rating demo using Jquery, PHP and Mysql
*/
include_once('rating.php')
?>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <title>Star rating demo using Jquery, PHP and Mysql</title>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
<link href="css/star-rating.min.css" media="all" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    
    <script src="js/star-rating.min.js" type="text/javascript"></script>
   
</head>

<body>
<h1>Star rating demo using Jquery, PHP and Mysql</h1>
 <table border=1>
 <tr><td >
    <img src="img/p1.jpeg">
    <h3>Product-1</h3> 
   <input value="<?= getRatingByProductId(connect(), 1); ?>" type="number" class="rating" min=0 max=5 step=0.1 data-size="md" data-stars="5" productId=1>
        </td>
   <td> 
   <img src="img/p2.jpeg"> 
     <h3>Product-2</h3> 
    <input value="<?= getRatingByProductId(connect(), 2); ?>" type="number" class="rating" min=0 max=5 step=0.1 data-size="md" data-stars="5" productId=2>
    </td>
    </tr></table>

     <script type="text/javascript">
        $(function(){
               $('.rating').on('rating.change', function(event, value, caption) {
                productId = $(this).attr('productId');
                $.ajax({
                  url: "rating.php",
                  dataType: "json",
                  data: {vote:value, productId:productId, type:'save'},
                  success: function( data ) {
                     alert("rating saved");
                  },
              error: function(e) {
                // Handle error here
                console.log(e);
              },
              timeout: 30000  
            });
              });

           


        });
    </script>
    </body>
</html>
