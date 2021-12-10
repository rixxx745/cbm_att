
<style>
	.collapse a{
		text-indent:10px;
	}
	nav#sidebar{
		/*background: url(assets/uploads/<?php echo $_SESSION['system']['cover_img'] ?>) !important*/
	}
</style>

<nav id="sidebar" class='mx-lt-5 bg-dark' >
		
		<div class="sidebar-list">
				<a href="index.php?page=home" class="nav-item nav-home"><span class='icon-field'></span></a>
				<a href="index.php?page=home" class="nav-item nav-home"><span class='icon-field'><i class="fa fa-tachometer-alt "></i></span> Dashboard</a>
			
			<?php if($_SESSION['login_type'] == 1): ?>
				<a href="index.php?page=programs" class="nav-item nav-programs"><span class='icon-field'><i class="fa fa-th-list "></i></span> Programs</a>
				<a href="index.php?page=courses" class="nav-item nav-courses"><span class='icon-field'><i class="fa fa-book "></i></span> Courses</a>
				<a href="index.php?page=class" class="nav-item nav-class"><span class='icon-field'><i class="fa fa-list-alt "></i></span> Class</a>
				<a href="index.php?page=faculty" class="nav-item nav-faculty"><span class='icon-field'><i class="fa fa-user-tie "></i></span> Faculty</a>
				<a href="index.php?page=students" class="nav-item nav-students"><span class='icon-field'><i class="fa fa-user-friends "></i></span> Student</a>
				<a href="index.php?page=class_course" class="nav-item nav-class_course"><span class='icon-field'><i class="fa fa-user-friends "></i></span> Class per Course</a>
				<a href="index.php?page=attendance_report" class="nav-item nav-attendance_report"><span class='icon-field'><i class="fa fa-tasks "></i></span> Report</a>
			<?php endif; ?>
			
			<?php if($_SESSION['login_type'] == 2): ?>
				<a href="index.php?page=classes" class="nav-item nav-classes"><span class='icon-field'><i class="fa fa-tasks"></i></span> Classes</a>
				<a href="index.php?page=check_attendance" class="nav-item nav-check_attendance"><span class='icon-field'><i class="fa fa-tasks "></i></span> Check Attendance</a>
				<a href="index.php?page=attendance_record" class="nav-item nav-attendance_record"><span class='icon-field'><i class="fa fa-tasks "></i></span> Attendance Record</a>
				<a href="index.php?page=attendance_report" class="nav-item nav-attendance_report"><span class='icon-field'><i class="fa fa-tasks "></i></span> Report</a>
			<?php endif; ?>

			<?php if($_SESSION['login_type'] == 3): ?>
				<a href="index.php?page=schedule" class="nav-item nav-schedule"><span class='icon-field'><i class="fa fa-th-list "></i></span> Schedule</a>
				<a href="index.php?page=overview" class="nav-item nav-overview_course"><span class='icon-field'><i class="fa fa-th-list "></i></span> Overview</a>
			<?php endif; ?>
			
			<?php if($_SESSION['login_type'] == 1): ?>
				<a href="index.php?page=users" class="nav-item nav-users"><span class='icon-field'><i class="fa fa-users "></i></span> Users</a>
				<!-- <a href="index.php?page=site_settings" class="nav-item nav-site_settings"><span class='icon-field'><i class="fa fa-cogs text-danger"></i></span> System Settings</a> -->
			<?php endif; ?>
		</div>

</nav>
<script>
	$('.nav_collapse').click(function(){
		console.log($(this).attr('href'))
		$($(this).attr('href')).collapse()
	})
	$('.nav-<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>').addClass('active')
</script>
