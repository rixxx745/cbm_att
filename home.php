<?php include 'db_connect.php' ?>
<style>
   span.float-right.summary_icon {
    font-size: 3rem;
    position: absolute;
    right: 1rem;
    top: 0;
}
.imgs{
		margin: .5em;
		max-width: calc(100%);
		max-height: calc(100%);
	}
	.imgs img{
		max-width: calc(100%);
		max-height: calc(100%);
		cursor: pointer;
	}
	#imagesCarousel,#imagesCarousel .carousel-inner,#imagesCarousel .carousel-item{
		height: 60vh !important;background: black;
	}
	#imagesCarousel .carousel-item.active{
		display: flex !important;
	}
	#imagesCarousel .carousel-item-next{
		display: flex !important;
	}
	#imagesCarousel .carousel-item img{
		margin: auto;
	}
	#imagesCarousel img{
		width: auto!important;
		height: auto!important;
		max-height: calc(100%)!important;
		max-width: calc(100%)!important;
	}
</style>

<div class="containe-fluid">
	<div class="row mt-3 ml-3 mr-3">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <center><?php echo "Welcome back ". $_SESSION['login_user_name']."!"  ?></center>
                    <center><img src="images/cbm.png" style="align=center; width:150px"></center>
                    <hr>
                </div>
            </div>      			
        </div>
    </div>
</div>

<div class="containe-fluid">
	<div class="row mt-3 ml-3 mr-3">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <center><h1>COLLEGE GOAL</h1><p>Produce globally competitive, value-laden professionals/entrepreneurs who can create social, environmental, and economic impact through research and community services.</p></center>
                    <center><h1>PROGRAM OBJECTIVES</h1>
                            <p align="left"><b>BACHELOR OF SCIENCE IN ECONOMICS OBJECTIVES</b><br>
                            <ul type="disc">
                                <li align="left">Equip students with knowledge in economic theory and its applications and with essential skills for undertaking economic analysis.</li>
                                <li align="left">Provide students with trainings to conduct research that will generate opportunities for economic development.</li>
                                <li align="left">Conduct trainings, seminars, workshops and other extension activities to address the social, environmental and economic needs of the community.</li>
                                <li align="left">Instill love and care for the environment in development efforts in the district and the region at large through active participation in local, national, and international conferences.</li>
                                <li align="left">Inculcate moral values and enhance social awareness for sustainable economic development.</li>
                            </ul></p>

                            <p align="left"><b>BACHELOR OF SCIENCE IN BUSINESS ADMINISTRATION MAJOR IN FINANCIAL MANAGEMENT(BSBA-FM) OBJECTIVES</b><br>
                            <ul type="disc">
                                <li align="left">Provide students with thorough understanding and skills of the mechanics of the financial system.</li>
                                <li align="left">Provide students with trainings to conduct research that will generate opportunities for community development.</li>
                                <li align="left">Conduct trainings, seminars, workshops and other extension activities to address the social, environmental and economic needs of the community.</li>
                                <li align="left">Inculcate moral values and enhance social awareness in the business world.</li> 
                            </ul></p>

                            <p align="left"><b>BACHELOR OF SCIENCE IN OFFICE ADMINISTRATION (BSOA) OBJECTIVES</b><br>
                            <ul type="disc">
                                <li align="left">Equip students with knowledge and skills to enable them to cope with the changing demands of technology.</li>
                                <li align="left">Promote entrepreneurship as a career option.</li>
                                <li align="left">Provide students with trainings to conduct research that will generate opportunities for community development.</li>
                                <li align="left">Conduct trainings, seminars, workshops and other extension activities to address the social, environmental and economic needs of the community.</li>
                                <li align="left">Enhance students’ interpersonal qualities of integrity, teamwork, self-esteem and positive attitude.</li> 
                            </ul></p>

                            <p align="left"><b>BACHELOR OF SCIENCE IN ENTREPRENEURSHIP (BSENT) OBJECTIVES</b><br>
                            <ul type="disc">
                                <li align="left">Equip students with entrepreneurial knowledge, skills and positive attitude in establishing and managing an enterprise.</li>
                                <li align="left">Provide students with trainings to conduct research that will generate opportunities for community development.</li>
                                <li align="left">Conduct trainings, seminars, workshops and other extension activities to address the social, environmental and economic needs of the community.</li>
                                <li align="left">Promote the establishment of sustainable business venture.</li>
                            </ul></p>

                            <p align="left"><b>BACHELOR OF SCIENCE IN ACOUNTANCY (BSA) OBJECTIVES</b><br>
                            <ul type="disc">
                                <li align="left">Equip students with thorough understanding of the concepts and applications of theories necessary in the practice of their profession.</li>
                                <li align="left">Strengthen the capability of students to grow and develop into a fully qualified professional accountant able to function in a global economy.</li>
                                <li align="left">Provide students with trainings to conduct research that will generate opportunities for community development.</li>
                                <li align="left">Conduct trainings, seminars, workshops and other extension activities to address the social, environmental and economic needs of the community.</li>
                                <li align="left">Inculcate values of honesty, integrity and social accountability.</li> 
                            </ul></p>
                    </center>
                </div>
            </div>      			
        </div>
    </div>
</div>

<script>
	$('#manage-records').submit(function(e){
        e.preventDefault()
        start_load()
        $.ajax({
            url:'ajax.php?action=save_track',
            data: new FormData($(this)[0]),
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            success:function(resp){
                resp=JSON.parse(resp)
                if(resp.status==1){
                    alert_toast("Data successfully saved",'success')
                    setTimeout(function(){
                        location.reload()
                    },800)

                }
                
            }
        })
    })
    $('#tracking_id').on('keypress',function(e){
        if(e.which == 13){
            get_person()
        }
    })
    $('#check').on('click',function(e){
            get_person()
    })
    function get_person(){
            start_load()
        $.ajax({
                url:'ajax.php?action=get_pdetails',
                method:"POST",
                data:{tracking_id : $('#tracking_id').val()},
                success:function(resp){
                    if(resp){
                        resp = JSON.parse(resp)
                        if(resp.status == 1){
                            $('#name').html(resp.name)
                            $('#address').html(resp.address)
                            $('[name="person_id"]').val(resp.id)
                            $('#details').show()
                            end_load()

                        }else if(resp.status == 2){
                            alert_toast("Unknow tracking id.",'danger');
                            end_load();
                        }
                    }
                }
            })
    }
</script>