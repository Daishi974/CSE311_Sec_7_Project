<?php include('partials/menu.php');?>

<div class="main-content">
  <div class="wrapper">
     <h1> Add Category  </h1>

     <br><br>
    
     <?php 
        
            if(isset($_SESSION['add']))
            {
                echo $_SESSION['add'];
                unset($_SESSION['add']);
            }

            if(isset($_SESSION['upload']))
            {
                echo $_SESSION['upload'];
                unset($_SESSION['upload']);
            }
        
        ?>

        <br><br>

     <!-- add category  starts -->

     <form action="" method="POST" enctype="multipart/form-data">
     <table class="tbl-30">
     <tr>
        <td> Title: </td>
        <td> 
        <input type= "text" name="title" placeholder="Category Title">
        </td>
     </tr>

     <tr>
                    <td>Select Image: </td>
                    <td>
                        <input type="file" name="image">
                    </td>
                </tr>

     <tr>
        <td> Featured: </td>
        <td>
            <input type="radio" name="featured" value="Yes"> Yes
            <input type="radio" name="featured" value="No"> No
        </td>
     </tr> 

     <tr>
        <td>Active:</td>
        <td>
            <input type="radio" name="active" value="Yes"> Yes
            <input type="radio" name="active" value="No"> No
        </td>
     </tr>  
     
     <tr>
        <td colspan="2">
        <input type="submit" name="submit" value="Add Category" class="btn-secondary">

        </td>
     </tr>

     </table>

     </form>
     <!-- add category form end -->

     <?php 
      // check whether submit button is clicked

      if(isset($_POST['submit']))
      {
        //echo "clicked";
        $title = $_POST['title'];
        // check whether button is clicked or not
        if(isset($_POST['featured']))
                {
                    //Get the Value from form
                    $featured = $_POST['featured'];
                }
                else
                {
                    // Default Value
                    $featured = "No";
                }

        if(isset($_POST['active']))
                {
                    $active = $_POST['active'];
                }
                else
                {
                  //default value
                    $active = "No";
                  
                } 
                // check if image is selected and set value for image name accordingly
                if(isset($_FILES['image']['name']))
                {
                    //Upload the Image
                    //To upload image we need image name, source path and destination path
                    $image_name = $_FILES['image']['name'];
                    
                    // Upload the Image only if image is selected
                    if($image_name != "")
                    {

                        //Auto Rename our Image
                        //Get the Extension of our image                         $ext = end(explode('.', $image_name));

                        //Rename the Image
                        $image_name = "Food_Category_".rand(000, 999).'.'.$ext; 
    
                        $source_path = $_FILES['image']['tmp_name'];

                        $destination_path = "../images/category/".$image_name;

                        //Finally Upload the Image
                        $upload = move_uploaded_file($source_path, $destination_path);

                        //Check whether the image is uploaded or not
                        //And if the image is not uploaded then we will stop the process and redirect with error message
                        if($upload==false)
                        {
                            //Set message
                            $_SESSION['upload'] = "<div class='error'>Failed to Upload Image. </div>";
                            //Redirect to Add Category Page
                            header('location:'.SITEURL.'admin/add-category.php');
                            //Stop the Process
                            die();
                        }

                    }
                }
                else
                {
                    //Don't Upload Image and set the image_name value as blank
                    $image_name="";
                }
                // create sql query to insert category into database
                $sql = "INSERT INTO tbl_category SET 
                title='$title',
                    image_name='$image_name',
                    featured='$featured',
                    active='$active'
                    ";

                    //query execution and save into database
                    $res = mysqli_query($conn, $sql);

                    // check whether the query is exceuted and if data is added

                    if($res==true)
                {
                    //Query Executed and Category Added
                    $_SESSION['add'] = "<div class='success'>Category Added Successfully.</div>";
                    //Redirect to Manage Category Page
                    header('location:'.SITEURL.'admin/manage-category.php');
                }
                else
                {
                    //Failed to Add CAtegory
                    $_SESSION['add'] = "<div class='error'>Failed to Add Category.</div>";
                    //Redirect to Manage Category Page
                    header('location:'.SITEURL.'admin/add-category.php');
                }



      }
     ?>


  </div>
</div>


<?php include('partials/footer.php');?>