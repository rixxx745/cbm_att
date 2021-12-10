<?php include('db_connect.php');?>

<div class="container-fluid">
	
	<div class="col-lg-12">
		<div class="row mb-4 mt-4">
			<div class="col-md-12">
				
			</div>
		</div>
		<div class="row">
			<!-- FORM Panel -->

			<!-- Table Panel -->
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<b>List of Classes</b>
					</div>
					<div class="card-body">
						<table class="table table-condensed table-bordered table-hover">
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th class="">Class</th>
									<th class="">Course</th>
									<th class="">Faculty</th>
									<!--<th class="">Time</th>-->
									<!--<th class="text-center">Action</th>-->
								</tr>
							</thead>
							<tbody>
								<?php 
								$i = 1;
								$class_subject = $conn->query("SELECT cs.*,concat(co.program,' ',c.level,'-',c.section) as `class`,s.course, f.faculty_name as faculty_name FROM class_course cs inner join `class` c on c.id = cs.class_id inner join programs co on co.id = c.program_id inner join faculty f on f.id = cs.faculty_id inner join courses s on s.id = cs.course_id ".($_SESSION['login_faculty_id'] ? " 
                                where f.id = {$_SESSION['login_faculty_id']} ":"")."
                                order by concat(co.program,' ',c.level,'-',c.section) asc");
                                while($row=$class_subject->fetch_assoc()):
								?>
								<tr>
									<td class="text-center"><?php echo $i++ ?></td>
									<td>
										<p> <b><?php echo $row['class'] ?></b></p>
									</td>
									<td class="">
										 <p> <b><?php echo $row['course'] ?></b></p>
									</td>
									<td class="">
										 <p> <b><?php echo $row['faculty_name'] ?></b></p>
									</td>
									<!--<td class="">
										 <p> <b><?php echo $row['time'] ?></b></p>
									</td>
									<td class="text-center">
										<button class="btn btn-sm btn-outline-primary edit_class_subject" type="button" data-id="<?php echo $row['id'] ?>" >Edit</button>
										<button class="btn btn-sm btn-outline-danger delete_class_subject" type="button" data-id="<?php echo $row['id'] ?>">Delete</button>
									</td>-->
								</tr>
								<?php endwhile; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Table Panel -->
		</div>
	</div>	

</div>
<style>
	
	td{
		vertical-align: middle !important;
	}
	td p{
		margin: unset
	}
	img{
		max-width:100px;
		max-height: :150px;
	}
</style>
<script>
	$(document).ready(function(){
		$('table').dataTable()
	})
	$('#new_class_course').click(function(){
		uni_modal("New Entry","manage_class_course.php","")
		
	})

	$('.edit_class_course').click(function(){
		uni_modal("Manage Entry Details","manage_class_course.php?id="+$(this).attr('data-id'),"")
		
	})
	$('.delete_class_course').click(function(){
		_conf("Are you sure to delete this class course?","delete_class_course",[$(this).attr('data-id')])
	})
	
	function delete_class_course($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_class_course',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>