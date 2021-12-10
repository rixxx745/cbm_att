<?php 
include 'db_connect.php'; 
if(isset($_GET['id'])){
$qry = $conn->query("SELECT * FROM class_course where id= ".$_GET['id']);
foreach($qry->fetch_array() as $k => $val){
    $$k=$val;
}
}
?>
<div class="container-fluid">
    <form action="" id="manage-class_course">
        <input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
        <div id="msg" class="form-group"></div>        
        <div class="form-group">
            <label for="" class="control-label">Class</label>
            <select name="class_id" id="" class="custom-select select2">
                <option value=""></option>
                <?php
                $class = $conn->query("SELECT c.*,concat(co.program,' ',c.level,'-',c.section) as `class` FROM `class` c inner join programs co on co.id = c.program_id order by concat(co.program,' ',c.level,'-',c.section) asc");
                while($row=$class->fetch_assoc()):
                ?>
                <option value="<?php echo $row['id'] ?>" <?php echo isset($class_id) && $class_id == $row['id'] ? 'selected' : '' ?>><?php echo $row['class'] ?></option>
                <?php endwhile; ?>
            </select>
        </div>
        <div class="form-group">
            <label for="" class="control-label">Faculty</label>
            <select name="faculty_id" id="" class="custom-select select2">
                <option value=""></option>
                <?php
                $class = $conn->query("SELECT * FROM faculty order by faculty_name asc");
                while($row=$class->fetch_assoc()):
                ?>
                <option value="<?php echo $row['id'] ?>" <?php echo isset($faculty_id) && $faculty_id == $row['id'] ? 'selected' : '' ?>><?php echo ucwords($row['faculty_name']) ?></option>
                <?php endwhile; ?>
            </select>
        </div>
        <div class="form-group">
            <label for="" class="control-label">Course</label>
            <select name="course_id" id="" class="custom-select select2">
                <option value=""></option>
                <?php
                $class = $conn->query("SELECT * FROM courses order by course asc");
                while($row=$class->fetch_assoc()):
                ?>
                <option value="<?php echo $row['id'] ?>" <?php echo isset($course_id) && $course_id == $row['id'] ? 'selected' : '' ?>><?php echo ucwords($row['course']) ?></option>
                <?php endwhile; ?>
            </select>
        </div>
    </form>
</div>
<script>
    $('#manage-class_course').on('reset',function(){
        $('#msg').html('')
        $('input:hidden').val('')
    })
    $('#manage-class_course').submit(function(e){
        e.preventDefault()
        start_load()
        $('#msg').html('')
        $.ajax({
            url:'ajax.php?action=save_class_course',
            data: new FormData($(this)[0]),
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            success:function(resp){
                if(resp==1){
                    alert_toast("Data successfully saved.",'success')
                        setTimeout(function(){
                            location.reload()
                        },1000)
                }else if(resp == 2){
                $('#msg').html('<div class="alert alert-danger mx-2">Data already exist.</div>')
                end_load()
                }   
            }
        })
    })
    $('.select2').select2({
        placeholder:"Please Select here",
        width:'100%'
    })
</script>