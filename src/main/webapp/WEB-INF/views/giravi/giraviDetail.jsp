<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.form-control-like-div {
	padding: 10px;
	display: block;
	border: 1px solid #c0ccda;
	border-radius: 0.25rem;
}

/* Bootstrap 4 text input with search icon */
.has-search .form-control {
	padding-left: 2.375rem;
}

.has-search .form-control-feedback {
	position: absolute;
	z-index: 2;
	display: block;
	width: 2.375rem;
	height: 2.375rem;
	line-height: 2.375rem;
	text-align: center;
	pointer-events: none;
	color: #aaa;
}

.select2-container--default .select2-search--dropdown .select2-search__field
	{
	padding-right: 35px;
	background: #fff url(img/search_1.png) no-repeat 99% 3px;
	background-size: 25px 25px;
}

.select2-container--default .select2-results__option--highlighted[aria-selected]
	{
	background-color: #e6e8ea;
}

.select2-results__option {
	padding: 6px;
}

.select2-container--default .select2-results__option--highlighted[aria-selected]
	{
	color: #464646;
}

.txt-fnt {
	color: #757575;
	font-size: 12px;
}

.fieldSuggestionTxt {
	float: right;
	font-size: 11px;
	line-height: 2;
	color: #2c2e9e;
	font-weight: 500;
}

.manageColumnsDropdown  .dropdown-menu {
	left: -30px !important;
	top: 5px !important;
}

.customer-form-group .select2-container {
	z-index: 1001 !important;
}

.containtStart {
	padding-top: 65px;
}

.fixed-header {
	width: 100%;
	position: fixed;
	top: 60px;
	bottom: auto;
	padding: 5px;
	background: #fff;
	z-index: 1040;
}


.ui-accordion-content{
	padding: 10px !important;
}

.avatar-upload {
  position: relative;
  max-width: 150px;
}
#avatar-edit-btn {
  position: absolute;
  right: 10px;
  z-index: 1;
  top: 2px;
  cursor: pointer;
  width: 34px;
  height: 34px;
  border-radius: 100%;
  background: #FFFFFF;
  border: 1px solid transparent;
  box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
  cursor: pointer;
  font-weight: normal;
  transition: all 0.2s ease-in-out;
}

#avatar-edit-btn i{
	position: absolute;
	top: 10px;
	left: 10px;
	color: #757575;
	text-align: center;
	margin: auto;
}

#avatar-edit-btn:hover {
  background: #f1f1f1;
  border-color: #d6d6d6;
}

.avatar-upload .avatar-preview {
  width: 150px;
  height: 150px;
  position: relative;
  border-radius: 100%;
  border: 4px solid #F8F8F8;
  box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
}
.avatar-upload .avatar-preview > div {
  width: 100%;
  height: 100%;
  border-radius: 100%;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
</style>
</head>
<body>
	<div id="giraviDetailDiv">
		<c:set var="totPaidAmt" value="0"></c:set>
		<input type="hidden" value="${loan.id }" id="giraviDetailId">
		<input type="hidden" value="N" id="giraviFlag">
		<input type="hidden" class="customerId" value="${loan.customer.id}">
		<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-10">
			<div>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb breadcrumb-style1 mg-b-10">
						<li class="breadcrumb-item"><a href="javascript:;">Giravi Master</a></li>
						<li class="breadcrumb-item active" aria-current="page">Giravi Detail</li>
					</ol>
				</nav>
				<h4 class="mg-b-0 tx-spacing--1">
					Giravi Detail No : <i class="giraviNo">${loan.loanNumber}</i>
				</h4>
			</div>
			<div class="d-md-block">
				<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5" onclick="closeGiraviDetail(this)">
					<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon" ></span> <span> Close</span>
				</button>
			</div>
		</div>
		<hr>
		<div class="giraviDetailAaccordion accordion-pink" id="giraviDetailAaccordion">
			<h6 class="accordion-title ui-accordion-header ui-corner-top ui-state-active" style="background-color: whitesmoke;">
				<span class="ui-accordion-header-icon"></span>Customer Detail
			</h6>
			<div class="accordion-body ui-accordion-content" style="background-color: whitesmoke;">
				<div class="row">
				
					<div class="col-md-2">
						<!-- <div class="avatar avatar-xxl">
							<span class="avatar-initial rounded-circle">MG</span>
						</div> -->
						<div class="avatar-upload">
							<button type="button" class="btn btn-default avatar-edit" id="avatar-edit-btn">
								<i class="fa fa-pencil-alt"></i>
							</button>
					       <!--  <div class="avatar-edit" id="avatar-edit-btn">
					            <label for="avatarImageUpload"></label>
					        </div> -->
					        <input type='file' class="hide" id="avatarImageUpload" accept=".png, .jpg, .jpeg" />
							<div class="avatar-preview">
								<c:choose>
									<c:when test="${loan.customer.imageString()==''}">
										<div id="avatarImagePreview" style="background-image: url(img/avatar.png);"></div>
									</c:when>
									<c:otherwise>
										<div id="avatarImagePreview" style="background-image: url(${loan.customer.imageString()});"></div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="customerDetail">
							<h4 style="color: #717171;">${loan.customer.cusName }</h4>
							<div>${loan.customer.mobile }</div>
							<div>${loan.customer.cusAddrL1 } ${loan.customer.cusAddrL2 }</div>
							<div>${loan.customer.city }</div>
							<div>${loan.customer.pincode }</div>
							<div>${loan.customer.state }</div>
						</div>
					</div>
					<div class="col"></div>
				</div>

			</div>

			<h6 class="accordion-title ui-accordion-header ui-corner-top ui-state-active">
				<span class="ui-accordion-header-icon"></span>Payment Summary
			</h6>
			<div class="accordion-body ui-accordion-content">
				<div class="row mg-t-10 mg-b-20">
					<div class="col">
						<div class="media">
							<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-warning tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-6">
								<i data-feather="bar-chart-2"></i>
							</div>
							<div class="media-body">
								<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold tx-nowrap mg-b-5 mg-md-b-8">Principle Amount</h6>
								<h4 class="tx-20 tx-sm-18 tx-md-20 tx-normal tx-rubik mg-b-0">
									<small>Rs:</small> <span class="principleAmtHead"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${loan.loanAmount}" /></span>
								</h4>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="media mg-t-20 mg-sm-t-0">
							<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-purple tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-5">
								<i data-feather="bar-chart-2"></i>
							</div>
							<div class="media-body">
								<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold mg-b-5 mg-md-b-8">Rate Of Interest</h6>
								<h4 class="tx-20 tx-sm-18 tx-md-20 tx-normal tx-rubik mg-b-0">
									<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${loan.intrestRate}" />
									<small> %</small>
								</h4>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="media mg-t-20 mg-sm-t-0">
							<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-primary tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-5">
								<i data-feather="bar-chart-2"></i>
							</div>
							<div class="media-body">
								<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold mg-b-5 mg-md-b-8">Start Date</h6>
								<h4 class="tx-20 tx-sm-18 tx-md-20 tx-normal tx-rubik mg-b-0">
									<fmt:formatDate pattern="dd-MM-yyyy" value="${loan.loanDate}" />
								</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="row mg-t-10 mg-b-20">
					<div class="col">
						<div class="media mg-t-20 mg-sm-t-0">
							<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-dark tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-4">
								<i data-feather="bar-chart-2"></i>
							</div>
							<div class="media-body">
								<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold mg-b-5 mg-md-b-8">Interest Amount</h6>
								<h4 class="tx-20 tx-sm-18 tx-md-20 tx-normal tx-rubik mg-b-0">
									<small>Rs:</small> <span class="interestAmtHead"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${currentInterestAmt}" /></span>
								</h4>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="media mg-t-20 mg-sm-t-0">
							<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-success tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-4">
								<i data-feather="bar-chart-2"></i>
							</div>
							<div class="media-body">
								<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold mg-b-5 mg-md-b-8">Paid Amount</h6>
								<h4 class="tx-20 tx-sm-18 tx-md-20 tx-normal tx-rubik mg-b-0 tx-success">
									<small>Rs:</small> <span class="totPaidAmtHead"></span>
								</h4>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="media mg-t-20 mg-sm-t-0">
							<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-pink tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-4">
								<i data-feather="bar-chart-2"></i>
							</div>
							<div class="media-body">
								<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold mg-b-5 mg-md-b-8">Balance Amount</h6>
								<h4 class="tx-20 tx-sm-18 tx-md-20 tx-normal tx-rubik mg-b-0 tx-pink">
									<small>Rs:</small> <span class="balanceAmtHead"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${balanceAmt}" /></span>
								</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
			<h6 class="accordion-title ui-accordion-header ui-corner-top ui-state-active">
				<span class="ui-accordion-header-icon"></span>Payment Transactions
			</h6>
			<div class="accordion-body ui-accordion-content">
				<table class="table giraviTransactionTable" id="giraviTransactionTable">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Date</th>
							<th scope="col" class="center">Paid Amount</th>
							<th scope="col" class="center">Pay Method</th>
							<th scope="col">Description</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="rCount" value="0"></c:set>
						<c:forEach items="${giraviTransactions}" var="tran">
							<c:set var="rCount" value="${rCount+1 }"></c:set>
							<c:set var="totPaidAmt" value="${totPaidAmt +  tran.tranAmount}"></c:set>
							<tr>
								<td scope="col" class="">${rCount}</td>
								<td scope="col" class=""><fmt:formatDate pattern="dd-MM-yyyy" value="${tran.tranDate}" /></td>
								<td scope="col" class="right bold"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${tran.tranAmount}" /></td>
								<td scope="col" class="center"><c:choose>
										<c:when test="${tran.tranMethod == 'C'}">
											<span class="badge badge-success">Cash</span>
										</c:when>
										<c:when test="${tran.tranMethod == 'B'}">
											<span class="badge badge-secondary">Bank Transfer</span>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>
								</td>
								<td scope="col" class="">Transaction made of Rs. <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${tran.tranAmount}" /></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<th scope="col" colspan="2" class="right">Total Amount Paid Rs:</th>
							<th scope="col" class="right tfootTotalPaidAmt"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${totPaidAmt}" /></th>
							<th scope="col"></th>
							<th scope="col"></th>
						</tr>
					</tfoot>
				</table>
			</div>

		</div>
	</div>
	<div class="webcamModalDiv"></div>
	<script type="text/javascript">

	//var cuss = JSON.stringify(${loan.customer});
	//console.log('cuss::'+cuss)
	
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					saveImageDataToserver(e.target.result);
					$/* ('#avatarImagePreview').css('background-image','url(' + e.target.result + ')');
					$('#avatarImagePreview').hide();
					$('#avatarImagePreview').fadeIn(650); */
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		$('#avatarImageUpload').change(function(){
			readURL(this);
		});
		
		$("#avatar-edit-btn").click(function() {
			var jc = $.confirm({
				icon: 'fa fa-check-circle',
			    title: 'Please select source of upload !',
			    columnClass: 'medium',
			    content: "Upload image from file system or from webcam.",
			    type: 'dark',
			    theme: 'bootstrap',
			    animationSpeed: 100,
			    typeAnimated: true,
			    autoClose: false,
			    buttons: {
			        file: {
			            text: 'File',
			            btnClass: ['btn-success','file'],
			            keys: ['f'],
			            action: function(){
			            	$('#avatarImageUpload').click()
			            }
			        },
			        webcam: {
			            text: 'Webcam',
			            btnClass: ['btn-success','webcam'],
			            keys: ['w'],
			            action: function(btn){
				            $('.jconfirm-buttons').find('button.webcam').prepend('&nbsp;<span class="spinner-border spinner-border-sm spinIcon"></span>&nbsp;&nbsp;')
			            	//startWebcam();
				            loadWebcamModal();
		    	            setTimeout(function(){
		    	            	$('.jconfirm-buttons').find('button.webcam').find('.spinIcon').remove();
		    	            	jc.close();
			    	        },2000);
			    	        return false;
			            }
			        },
			        close: {
			            text: 'close',
			            btnClass: ['btn-default','close'],
			            keys: ['c'],
			            action: function(){
		    	            //alert('c')
			            }
			        }
			    }
			});
			//readURL(this);
		});

		$(function() {
			$('#giraviTransactionTable').DataTable({
				responsive : true,
				language : {
					searchPlaceholder : 'Search transaction...',
					sSearch : '',
					lengthMenu : '_MENU_ per/page',
				},
				"initComplete" : function() {
					var giraviId = $('#giraviDetailId').val();
					$('#giraviDetailDiv').find('.dataTables_filter').append(
									'<div class="input-group mg-r-10" style="float: left;width: auto;">'
											+ '<input type="text" class="fromDateFilter" placeholder="From Date" style="width: 115px;">'
											+ '<div class="input-group-append">'
											+ '<span class="input-group-text" style="background-color: #fff;"><i class="fa fa-calendar"></i></span></div></div>'
											+ '<div class="input-group mg-r-10" style="float: left;width: auto;">'
											+ '<input type="text" class="toDateFilter" placeholder="To Date" style="width: 115px;">'
											+ '<div class="input-group-append">'
											+ '<span class="input-group-text" style="background-color: #fff;"><i class="fa fa-calendar"></i></span></div></div>'
											+ '<button type="button" class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-xs-b-10" onclick=openAddPaymentModal(this,true) data-loanid="'
											+ giraviId+ '" style="float:right;">'
											+ '<i class="fa fa-credit-card"></i> <span> &nbsp;&nbsp;Pay Now</span>'
											+ '</button>');
					feather.replace();
					$('.dataTables_length').find('select').select2({
						minimumResultsForSearch : -1
					});
					$('table.dataTable').css("padding", "0px");
					$('table.dataTable tfoot th').css("border-color", "#e2e2e2");

					var balanceAmt = 0;
					var principleAmt = parseFloat($('.principleAmtHead').text().split(',').join(""));
					var interestAmt = parseFloat($('.interestAmtHead').text().split(',').join(""));
					var totPaidAmt = parseFloat($('#giraviTransactionTable').find('.tfootTotalPaidAmt').text().split(',').join(""));
					$('.totPaidAmtHead').text(totPaidAmt.toFixed(2));
					$('.balanceAmtHead').text(((principleAmt + interestAmt) - totPaidAmt).toFixed(2));

				}
			});

			$('.fromDateFilter').datepicker({
				dateFormat : 'dd-mm-yy',
				showOtherMonths : true,
				selectOtherMonths : true,
				changeMonth : true,
				changeYear : true,
				"onSelect" : function(date) {
					minDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(date).getTime();
					allGiraviTable.draw();
				}
			}).keyup(function() {
				minDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(this.value).getTime();
				allGiraviTable.draw();
			});

			$('.toDateFilter').datepicker({
				dateFormat : 'dd-mm-yy',
				showOtherMonths : true,
				selectOtherMonths : true,
				changeMonth : true,
				changeYear : true,
				"onSelect" : function(date) {
					maxDateFilter = moment($(this).val(), 'DD-MM-YYYY')
							.toDate();//new Date(date).getTime();
					allGiraviTable.draw();
				}
			}).keyup(function() {
				maxDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(this.value).getTime();
				allGiraviTable.draw();
			});
		});

		function closeGiraviDetail(btnObj) {
			$(btnObj).find('.fa').toggleClass('hide');
			$(btnObj).find('.spinIcon').toggleClass('hide');
			setTimeout(function() {
				$('.giraviTable').toggleClass('hide');
				$('.transactionPalceholder').toggleClass('hide');
				$('.transactionPalceholder').empty();
			}, 500);
		}

		function openAddPaymentModal(obj, isReload) {
			clearPaymentForm();
			var loanId = $(obj).attr('data-loanid');
			$('#addPaymentForm').find('input.loanId').val(loanId);
			if (isReload) {
				$('.savePaymentBtn').attr('isreload', true);
			} else {
				$('.savePaymentBtn').attr('isreload', false);
			}
			$('#modalAddPayment').modal('toggle');
		}

		function loadWebcamModal(){
			var loanid = $('#giraviDetailId').val();
			$.ajax({
				url : '/app/giravi/giraviMaster/getWebcamModal',
				method : 'GET',
				data : {
					'loadId' : loanid
				},
				success : function(resp) {
					$('.webcamModalDiv').empty();
					$('.webcamModalDiv').html(resp);
					setTimeout(function() {
						$('#webcamModal').modal('toggle');
					},500);
				}
			});
		}

		function saveImageDataToserver(dataURI) {
			$.ajax({
				url : '/app/giravi/giraviMaster/saveWebcamImage',
				method : 'POST',
				data : {
					'customerId' : $('#giraviDetailDiv').find('input.customerId').val(),
					'dataURI' : dataURI.split('base64,')[1]
				},
				success : function(resp) {
					if(resp.status=="success"){
						$('#avatarImagePreview').css('background-image','url(data:image/png;base64,' + resp.respBytes + ')');
						$('#avatarImagePreview').hide();
						$('#avatarImagePreview').fadeIn(650);
						$('#webcamModal').modal('toggle');
					}else{
						alert('Unable to save image.','e');
					}
					
				}
			});
		}
	</script>
</body>