<html>
<body>
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item"><a href="#">Admin</a></li>
					<li class="breadcrumb-item active" aria-current="page">Module Setting</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">Module Setting</h4>
		</div>
		<div class="d-none d-md-block">
			<button class="btn btn-sm pd-x-15 btn-white btn-uppercase hide">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail wd-10 mg-r-5">
					<path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
					<polyline points="22,6 12,13 2,6"></polyline></svg>
				Email
			</button>
			<button class="btn btn-sm pd-x-15 btn-white btn-uppercase mg-l-5 hide">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-printer wd-10 mg-r-5">
					<polyline points="6 9 6 2 18 2 18 9"></polyline>
					<path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path>
					<rect x="6" y="14" width="12" height="8"></rect></svg>
				Print
			</button>
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 listToFormBtn">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file wd-10 mg-r-5">
					<path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
					<polyline points="13 2 13 9 20 9"></polyline></svg>
				<span>All Modules</span>
			</button>
		</div>
	</div>
	<div data-label="Module Form" class="df-example demo-form">
		<form>
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="inputEmail3" placeholder="Email">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword3" placeholder="Password">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-sm-2 pt-0">Radios</label>
				<div class="col-sm-10">
					<div class="custom-control custom-radio">
						<input type="radio" name="customRadio" class="custom-control-input" checked=""> <label class="custom-control-label">First radio</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="customRadio" class="custom-control-input"> <label class="custom-control-label">Second radio</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="customRadio" class="custom-control-input" disabled=""> <label class="custom-control-label">Third disabled radio</label>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2">Checkbox</div>
				<div class="col-sm-10">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"> <label class="custom-control-label">Example checkbox</label>
					</div>
				</div>
			</div>
			<div class="form-group row mg-b-0">
				<div class="col-sm-10">
					<button type="submit" class="btn btn-primary">Submit Form</button>
				</div>
			</div>
		</form>
	</div>
	<div data-label="Example" class="df-example demo-table hide">
		<div class="table-responsive">
			<table class="table mg-b-0">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Name</th>
						<th scope="col">Job Title</th>
						<th scope="col">Degree</th>
						<th scope="col">Salary</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Adrian Monino</td>
						<td>Front-End Engineer</td>
						<td>Computer Science</td>
						<td>$120,000</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Socrates Itumay</td>
						<td>Software Engineer</td>
						<td>Computer Engineering</td>
						<td>$150,000</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>Reynante Labares</td>
						<td>Product Manager</td>
						<td>Business Management</td>
						<td>$250,000</td>
					</tr>
					<tr>
						<th scope="row">4</th>
						<td>Hamza Macasindil</td>
						<td>Software Engineer</td>
						<td>Computer Engineering</td>
						<td>$140,000</td>
					</tr>
					<tr>
						<th scope="row">5</th>
						<td>Roven Galeon</td>
						<td>Project Manager</td>
						<td>Accountancy</td>
						<td>$160,000</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- table-responsive -->
	</div>
	<script type="text/javascript">
	
		$('.listToFormBtn').on('click',function(){
			if($('.demo-table').hasClass('hide')){
				$('.demo-table').removeClass('hide');
				$('.demo-form').addClass('hide');
				$(this).find('span').text('Add new module')
			}else{
				$('.demo-table').addClass('hide');
				$('.demo-form').removeClass('hide');
				$(this).find('span').text('All modules')
			}
		})
	</script>
</body>
</html>