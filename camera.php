<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="HandheldFriendly" content="true">    
    <title>Attendance</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/webcamjs/1.0.25/webcam.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" />
    <style type="text/css">
        #results { padding:20px; border:1px solid; background: #ffffff; }
    </style>
</head>
<body>
  
<div class="container">
    <h1 class="text-center" style="margin-top: 30px">Attendance</h1><br>
   
    <form action="action.php" method="POST">
        <div class="row">
            <div class="col-md-6 text-center">
                <div id="my_camera"></div>
                <br/>
                <input class="btn btn-sm btn-outline-info btn-wave col-md-4 edit_class_subject" type=button  value="Take Snapshot" onClick="take_snapshot()">
                <input type="hidden" name="image" class="image-tag">
            </div>
            <div class="col-md-6">
                <div id="results">Your captured image will appear here...</div>
            </div>
            <div class="col-md-12 text-center">
                <br/>
                <!--<center><button class="btn-sm btn-block btn-wave col-md-4 btn-primary">Submit</button></center> action="storeImage.php"-->
				<button class="btn btn-sm btn-success btn-wave col-md-4 submit_selfie" >Submit</button> 
				<a href="index.php?page=schedule"><button class="btn btn-sm btn-danger btn-wave col-md-4 cancel" type="button" data-id="<?php echo $row['id'] ?>">Cancel</button></a>
            </div>
        </div>
    </form>
</div>
  
<!-- Configure a few settings and attach camera -->
<script language="JavaScript">
    var options = {
      shutter_mp3_url: "jpeg_camera/shutter.mp3",
	  
    };

    Webcam.set({
        width: 490,
        height: 390,
        image_format: 'jpeg',
        jpeg_quality: 90,
    });
  
    Webcam.attach('#my_camera');
  
    function take_snapshot() {
        Webcam.snap( function(data_uri) {
            $(".image-tag").val(data_uri);
            document.getElementById('results').innerHTML = '<img src="'+data_uri+'"/>';
        } );
    }
    $(document).submit_selfie(function(){
	if('<?php echo isset($class_subject_id) ? 1 : 0 ?>' == 1){
		start_load()
		$.ajax({
			url:'ajax.php?action=get_class_list',
			method:'POST',
			data:{class_subject_id:$('#class_subject_id').val(),doc:$('#doc').val(),att_id :'<?php echo isset($id) ? $id : '' ?>' },
			success:function(resp){
				if(resp){
					resp = JSON.parse(resp)
					var _table = $('#table_clone table').clone()
					$('#att-list').html('')
					$('#att-list').append(_table)
					var _type = ['Absent','Present','Late'];
					var data = resp.data;
					var record = resp.record;
					var attendance_id = !!resp.attendance_id ? resp.attendance_id : '';
					if(Object.keys(data).length > 0){
						var i = 1;
						Object.keys(data).map(function(k){
							var name = data[k].name;
							var id = data[k].id;
							var tr = $('<tr></tr>')
							var opts = $('#chk_clone').clone()

							opts.find('.present-inp').attr({'name':'type['+id+']','id':'present_'+id})
							opts.find('.absent-inp').attr({'name':'type['+id+']','id':'absent_'+id})
							opts.find('.late-inp').attr({'name':'type['+id+']','id':'late_'+id})

							opts.find('.present-lbl').attr({'for':'present_'+id})
							opts.find('.absent-lbl').attr({'for':'absent_'+id})
							opts.find('.late-lbl').attr({'for':'late_'+id})

							tr.append('<td class="text-center">'+(i++)+'</td>')
							tr.append('<td class="">'+(name)+'</td>')
							var td = '<td>';
								td += '<input type="hidden" name="student_id['+id+']" value="'+id+'">';
								td += opts.html();
								td += '</td>';
							tr.append(td)

							_table.find('tbody').append(tr)
						})
						$('#submit-btn-field').show()
						$('#edit_att').attr('data-id',attendance_id)
					}else{
							var tr = $('<tr></tr>')
							tr.append('<td class="text-center" colspan="3">No data.</td>')
							_table.find('tbody').append(tr)
						$('#submit-btn-field').attr('data-id','').hide()
						$('#edit_att').attr('data-id','')
					} 
					$('#att-list').html('')
					$('#att-list').append(_table)
					if(Object.keys(record).length > 0){
						Object.keys(record).map(k=>{
							// console.log('[name="type['+record[k].student_id+']"][value="'+record[k].type+'"]')
							$('#att-list').find('[name="type['+record[k].student_id+']"][value="'+record[k].type+'"]').prop('checked',true)
						})
					}
				}
			},
			complete:function(){
				$("input:checkbox").on('keyup keypress change',function(){
				    var group = "input:checkbox[name='"+$(this).attr("name")+"']";
				    $(group).prop("checked",false);
				    $(this).prop("checked",true);
				});
				$('#edit_att').click(function(){
					location.href = 'index.php?page=check_attendance&attendance_id='+$(this).attr('data-id')
				})
				end_load()
			}
		})
	}
	
})
</script>
 
</body>
</html>