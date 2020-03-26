<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
		.alert{
			margin-top: 10px;
		}
</style>
<body>
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item"><a href="#">Admin</a></li>
					<li class="breadcrumb-item active" aria-current="page">Menu Setting</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">Menu Setting</h4>
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
				<span>Add New Menu</span>
			</button>
		</div>
	</div>
	<div data-label="Entity Form" class="df-example menu-form hide">
		<form id="menuForm">
			<input type="text" id="menuId" class="menuId" hidden />
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Module Name</label>
				<div class="col-sm-10">
					<!-- <input type="text" class="form-control" id="inputEmail3" placeholder="Select Module Name"> -->
					<select id="moduleList" class="form-control">
						<c:forEach items="${moduleList}" var="module">
							<c:set value="${rCount + 1}" var="rCount"></c:set>
							<option value="${module.id}">${module.moduleName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-2 col-form-label mandlabel">Menu Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control mandatory" id="menuName" placeholder="Enter Menu Name" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character.">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Menu Name Ol</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="menuNameOl" placeholder="Enter Menu Name Ol">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-2 col-form-label mandlabel">Page URL</label>
				<div class="col-sm-10">
					<input type="text" class="form-control mandatory" id="pageUrl" placeholder="Enter Page URL" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character. ">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-sm-2 pt-0">Status</label>
				<div class="col-sm-10">
					<div class="custom-control custom-radio">
						<input type="radio" id="mStatusE" value="E" name="mStatus" class="custom-control-input" checked> <label class="custom-control-label" for="mStatusE">Enable</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="mStatusD" value="D" name="mStatus" class="custom-control-input"> <label class="custom-control-label" for="mStatusD">Disable</label>
					</div>
				</div>
			</div>
			<div class="form-group row mg-b-0">
				<label class="col-form-label col-sm-2 pt-0"></label>
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary menuSaveBtn" data-flag="N" data-menuid="" onclick="saveMenu(this)" disabled>Save Menu</button>
					<button type="button" class="btn btn-warning" onclick="clearForm()">Clear</button>
				</div>
			</div>
		</form>
	</div>
	<div data-label="menu List" class="menuTable-div df-example">
		<div class="table-responsive">
			<table class="table mg-b-0" id="menuListTable">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Menu Name</th>
						<th scope="col">Menu Name Ol</th>
						<th scope="col">Module Name</th>
						<th scope="col">Page URL</th>
						<th scope="col">Status</th>
						<th scope="col" class="center">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:set value="0" var="rCount"></c:set>
					<c:forEach items="${allMenus}" var="menu">
						<c:set value="${rCount + 1}" var="rCount"></c:set>
						<tr>
							<td class="menuCount">${rCount}</td>
							<td class="menuName">${menu.menuName}</td>
							<td class="menuNameOl">${menu.menuNameOl}</td>
							<td class="modName">${menu.module.moduleName}</td>
							<td class="menulink">${menu.link}</td>
							<td class="menuStatus">${menu.status} <span class="menuStatus hide">${menu.status}</span></td>
							<td class="">
								<div class="text-center">
									<button type="button" onclick="setFormData(this,'M')" data-menuid="${menu.id}" data-moduleid="${menu.module.id}" class="btn btn-success btn-icon btn-sm">
										<i class="fa fa-pencil-alt" aria-hidden="true"></i>
									</button>
									<button type="button" onclick="setFormData(this,'D')" data-menuid="${menu.id}" class="btn btn-danger btn-icon btn-sm">
										<i class="fa fa-trash-alt" aria-hidden="true"></i>
									</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- table-responsive -->
	</div>
	<script type="text/javascript">
	
		var needPageReload = false;
	
		$('.listToFormBtn').on('click',function(){
			if($('.menu-form').hasClass('hide')){
				$('.menu-form').removeClass('hide');
				$('.menuTable-div').addClass('hide');
				$(this).find('span').text('All Menus')
			}else{
				$('.menu-form').addClass('hide');
				$('.menuTable-div').removeClass('hide');
				$(this).find('span').text('Add New Menu')
			}
		})
		
		
		$('.table').DataTable({
			  language: {
			    searchPlaceholder: 'Search...',
			    sSearch: '',
			    lengthMenu: '_MENU_ items/page',
			  }
		});
		
		
		$('#menuForm').parsley().on('field:validated', function() {
			var parsleyFieldLength = $('#menuForm').find('.mandatory').length;
		    var isValidForm = false;
			if($('#menuForm').find('.parsley-success').length==parsleyFieldLength){
				isValidForm = true;
			}else{
				isValidForm = false;
			}
			if(isValidForm){
				$('.menuSaveBtn').prop('disabled',false);
			}else{
				$('.menuSaveBtn').prop('disabled',true);
			}
		 }).on('form:submit', function() {
		    return false; // Don't submit form 
		 });
		
		
		function setFormData(btnObj,flg){
			$('.listToFormBtn').click();
			needPageReload = false;
			$('.menu-form').find('.alert').remove();
			var tr = $(btnObj).closest('tr');
			var modId = $(btnObj).attr('data-menuid');
			
			$('#menuName').val($(tr).find('.menuName').text().trim());                                           
			$('#menuNameOl').val($(tr).find('.menuNameOl').text().trim());
			$('#moduleList').val($(btnObj).attr('data-moduleid'));
			$('#pageUrl').val($(tr).find('.menulink').text().trim());
			if($(tr).find('span.menuStatus').text()=="E")  {
				$('#mStatusE').prop("checked",true);
			}else{
				$('#mStatusD').prop("checked",true);
			}                                     
			
			$('#menuForm').find('input.menuId').val(modId); 
			$('#menuForm').find('.menuSaveBtn').attr('data-flag',flg);
			$('#menuForm').parsley().validate();
		}
		
		
		function saveMenu(btnObj){
			var flag = $(btnObj).data('flag');
			console.log();
			var menuId = null;
			
			if(flag=='N'){
				menuId = 0;
			}else{
				menuId = $("#menuId").attr('data-parsley-id');
			}
			
			var formData = {
				'menuName'   : 	$('#menuName').val(),
				'menuNameOl' : 	$('#menuNameOl').val(),
				'moduleId'   :  $('#moduleList option:selected').val(),
				'moduleName' :  $('#moduleList option:selected').text(),
				'status'     :	$('#menuForm').find('input[name="mStatus"]:checked').val(),
				'menuId'     :  menuId,
				'flag'       :  flag,
				'pageUrl'    :  $('#pageUrl').val(),
			}
			
			$.ajax({
				url : '/app/admin/menuMaster/saveUpdateDeleteMenu',
				method : 'POST',
				data : formData,
				async : false,
				success : function(resp) {
					
					if(resp.status=="success"){
						needPageReload=true;
						clearForm($('#menuForm'));
						$('.menu-form').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">'+
					   '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
					}else{
						needPageReload=false;
						$('.menu-form').find('.alert').remove();
						$('.menu-form').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">'+
			           '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
					}
				}
			});
		}
		
		function clearForm(formObje){
			var formObj = formObje ? formObje : $('#menuForm');
			$('.menu-form').find('.alert').remove();
			$('#menuForm').find('input').val('');
			$('#menuForm').find('select').val('');
			$('#menuForm').find('.select2-hidden-accessible').val(null).trigger('change');
			$('#menuForm').find('textarea').val('');
			$('#mStatusE').val('E');
			$('#mStatusD').val('D');
			$('#menuForm').find('input[type="radio"]:first').prop('checked',true);
			$('#menuForm').find('.alert').remove();
			$('#menuForm').find('.select2-hidden-accessible').removeClass('parsley-error');
			$('#menuForm').find('.parsley-error').removeClass('.parsley-error');
			$('#menuForm').find('.parsley-success').removeClass('.parsley-success');
			$('#menuForm').find('.select2-selection').removeClass('.parsley-error');
			$('#menuForm').find('input.menuId').val("0"),  
			$('#menuForm').find('.menuSaveBtn').attr('data-flag',"N");
			$('#menuForm').find('.menuSaveBtn').removeClass('btn-danger').addClass('btn-primary');
			$('#menuForm').find('.menuSaveBtn').text('Save Menu');
			$('#menuForm').find('.menuSaveBtn').prop('disabled',true);
			$('#menuForm').parsley().reset();
		}
	</script>
</body>
</html>