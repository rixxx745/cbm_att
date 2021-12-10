<?php include('db_connect.php');?>

<div class="container-fluid">
	
	<div class="col-lg-12"><br>
		<div class="row">
			<!-- FORM Panel -->
			<div class="col-md-4">
			<form action="" id="manage-program">
				<div class="card">
					<div class="card-header">
						    Program Form
				  	</div>
					<div class="card-body">
							<input type="hidden" name="id">
							<div id="msg"></div>
							<div class="form-group">
								<label class="control-label">Program</label>
								<input type="text" class="form-control" name="program">
							</div>
							<div class="form-group">
								<label class="control-label">Description</label>
								<textarea name="description" id="" cols="30" rows="4" class="form-control"></textarea>
							</div>
					</div>
							
					<div class="card-footer">
						<div class="row">
							<div class="col-md-12">
								<button class="btn btn-sm btn-primary col-sm-3 offset-md-3"> Save</button>
								<button class="btn btn-sm btn-default col-sm-3" type="reset"> Cancel</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			</div>
			<!-- FORM Panel -->

			<!-- Table Panel -->
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">
						<b>List of Programs</b>
					</div>
					<div class="card-body">
						<table class="table table-bordered table-hover">

							<thead>
								<tr>
									<th class="text-center" width="5%">#</th>
									<th class="text-center">Program</th>
									<th class="text-center" width="25%">Action</th>
								</tr>
							</thead>
							<tbody>
								<?php 
								$i = 1;
								$program = $conn->query("SELECT * FROM programs order by id asc");
								while($row=$program->fetch_assoc()):
								?>
								<tr>
									<td class="text-center"><?php echo $i++ ?></td>
									<td class="">
										<p><b><?php echo ucwords($row['program']) ?></b></p>
										<small><i><?php echo $row['description'] ?></i></small>
									</td>
									<td class="text-center">
										<button class="btn btn-sm btn-primary edit_program" type="button" data-id="<?php echo $row['id'] ?>"  data-program="<?php echo $row['program'] ?>"  data-description="<?php echo $row['description'] ?>" >Edit</button>
										<button class="btn btn-sm btn-danger delete_program" type="button" data-id="<?php echo $row['id'] ?>">Delete</button>
									</td>
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
	td p {
	    margin: unset;
	}
</style>
<script>
	$('#manage-program').on('reset',function(){
		$('#msg').html('')
		$('input:hidden').val('')
	})
	$('#manage-program').submit(function(e){
		e.preventDefault()
		$('#msg').html('')
		start_load()
		$.ajax({
			url:'ajax.php?action=save_program',
			data: new FormData($(this)[0]),
		    cache: false,
		    contentType: false,
		    processData: false,
		    method: 'POST',
		    type: 'POST',
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully saved",'success')
					setTimeout(function(){
						location.reload()
					},1500)
				}else if(resp == 2){
				$('#msg').html('<div class="alert alert-danger mx-2">Program already exist.</div>')
				end_load()
				}			
			}
		})
	})
	$('.edit_program').click(function(){
		start_load()
			var cat = $('#manage-program')
			cat.get(0).reset()
			cat.find("[name='id']").val($(this).attr('data-id'))
			cat.find("[name='program']").val($(this).attr('data-program'))
			cat.find("[name='description']").val($(this).attr('data-description'))
		end_load()
	})
	$('.delete_program').click(function(){
		_conf("Are you sure you want to delete this program?","delete_program",[$(this).attr('data-id')])
	})
	function delete_program($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_program',
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
	$('table').dataTable()
</script>