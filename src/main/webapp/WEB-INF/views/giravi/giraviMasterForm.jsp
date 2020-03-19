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

.itemNameTd {
	max-width: 300px;
	word-break: break-word;
}

.itemTaxTd {
	/* word-break: break-all;
    max-width: 70px; */
	
}

.manageColumnsDropdown  .dropdown-menu {
	left: -30px !important;
	top: 5px !important;
}

.customer-form-group .select2-container {
	z-index: 1001 !important;
}
.containtStart{
	padding-top: 65px;
}

.fixed-header{
	width: 100%;
    position: fixed;
    top: 60px;
    bottom: auto;
    padding: 5px;
    background: #fff;
    z-index:1040;
}
</style>
</head>
<body>
	<input type="hidden" value="0" id="giraviId">
	<input type="hidden" value="N" id="giraviFlag">
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-20 bd-b pd-b-10 fixed-header">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-5">
					<li class="breadcrumb-item active" aria-current="page">New Giravi</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">Create New Giravi</h4>
		</div>
		<!-- <div class="d-none d-md-block"></div> -->
		<div style="margin: auto;">
			<button type="button" class="btn btn-white" onclick="cancelGiravi()">Cancel</button>
			<button type="button" data-flag="N" class="btn btn-primary giraviSave" id="giraviSaveBtn" onclick="saveGiravi(this)">Save Giravi</button>
		</div>
	</div>
	<div class="row containtStart">
		<div class="col-md-6">
			<h5>Bill To</h5>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group mg-b-0 customer-form-group">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Select customer</label>
						<div class="parsley-select">
							<div class="form-group has-search">
								<span class="fa fa-search form-control-feedback newentry"></span>
								<select class="form-control mandatory customerSelect parsleyField" required data-parsley-trigger="input" data-parsley-validation-threshold="0">
									<c:forEach items="${customers}" var="cus">
										<c:set var="newCus" value="${cus }" />
										<option value="${cus.id}" data-obj='<%= new ObjectMapper().writeValueAsString(pageContext.getAttribute("newCus"))%>'>${cus.cusName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="billToDetail"></div>
				</div>
			</div>
		</div>
		<!-- <div class="divider-text divider-vertical" data-text="and"></div> -->
		<div class="col-md-6 giravi-detail-group">
			<h5>Giravi Detail</h5>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group mg-b-5">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Giravi Number</label>
						<input type="text" class="form-control mandatory giraviNum parsleyField" placeholder="Enter giravi number" autocomplete="off" required data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="18" data-parsley-minlength-message="Enter at least 2 character. " data-parsley-maxlength-message="Cannot exist more than 18 character">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group mg-b-5">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Giravi Date</label>
						<input type="text" class="form-control mandatory giraviDate dateCleave parsleyField" readonly placeholder="Select giravi date" autocomplete="off" required data-parsley-trigger="change" data-parsley-trigger="keyup"  data-parsley-minlength="10" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Date is incorrect" data-parsley-maxlength-message="Date is incorrect">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group mg-b-5">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">P.O/S.O Number</label>
						<input type="text" class="form-control posonum" placeholder="Enter P.O. / S.O. number " autocomplete="off">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group mg-b-5">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Payment Due Date</label>
						<input type="text" class="form-control paymentDueDate dateCleave" placeholder="Select payment due date" autocomplete="off" readonly>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="col-md-12">
			<hr>
			<div class="d-flex" style="align-items: center;">
				<div class="pd-10 flex-grow-1">
					<h5 class="mandlabel">Giravi Items</h5>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table giraviItemsTable border-b">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Item</th>
							<th scope="col">Quantity</th>
							<th scope="col">Gross Weight</th>
							<th scope="col">Net Weight</th>
							<th scope="col">Valuation</th>
							<th scope="col">Payable Amount</th>
							<th scope="col" style="text-align: center;">Action</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<tfoot>
						<!-- <tr class="totalTr hide">
							<th colspan="3" style="text-align: right;">
								<b>Total :</b>
							</th>
							<th class="qtyTotTfoot">
								<span>0</span>
								items
							</th>
							<th class="upTotTfoot col-up">
								Rs:
								<span>0</span>
							</th>
							<th class="taTotTfoot">
								Rs:
								<span>0</span>
							</th>
							<th class="dTotTfoot col-disc">
								Rs:
								<span>0</span>
							</th>
							<th class="taxAmtTotTfoot">
								Rs:
								<span>0</span>
							</th>
							<th class="taxTotTfoot col-tax">
								Rs:
								<span>0</span>
							</th>
							<th class=""></th>
						</tr> -->
					</tfoot>
				</table>
			</div>
			<div style="text-align: right; padding: 20px 0px;">
				<a href="javascript:;" onclick="openAddGiraviItemModal()" class="btn btn-outline-primary">
					<i class="fa fa-plus"></i>
					&nbsp; &nbsp; Add Item
				</a>
			</div>
			<hr style="margin-top: 0;">
		</div>
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-7">
					<div class="accordion accordion-style1">
						<h6 class="recipientDescCollapse">Write a description to the recipient (will be printed at the footer of an giravi).......</h6>
						<div style="padding: 0;">
							<textarea class="form-control recipientDesc" style="border: 0; border-top: 1px solid #e6e6e6;" rows="5" placeholder="Write a description to the recipient..."></textarea>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-control-like-div bottom-total-group">
						<div class="d-flex" style="align-items: center;">
							<div class=" flex-grow-1">
								<b>Giravi Amount</b>
							</div>
							<!-- <div class="pd-10">Flex item</div> -->
							<div class="mg-l-auto">
								<b>Rs :</b>
								<b class="giraviMainTotAmt">0.00</b>
							</div>
						</div>
						<hr style="margin: 3px">
						<div class="d-flex" style="align-items: center;">
							<div class=" flex-grow-1">
								<b>Discount Amount</b>
							</div>
							<!-- <div class="pd-10">Flex item</div> -->
							<div class=" mg-l-auto">
								<b>Rs :</b>
								<b class="giraviMainDisAmt">0.00</b>
							</div>
						</div>
						<hr style="margin: 3px">
						<div class="d-flex" style="align-items: center;">
							<div class=" flex-grow-1">
								<b>Taxable Amount</b>
							</div>
							<!-- <div class="pd-10">Flex item</div> -->
							<div class=" mg-l-auto">
								<b>Rs :</b>
								<b class="giraviMainTaxableAmt">0.00</b>
							</div>
						</div>
						<hr style="margin: 3px">
						<div class="d-flex" style="align-items: center;">
							<div class=" flex-grow-1">
								<b>Tax Amount</b>
							</div>
							<!-- <div class="pd-10">Flex item</div> -->
							<div class=" mg-l-auto">
								<b>Rs :</b>
								<b class="giraviMainTaxAmt">0.00</b>
							</div>
						</div>
						<hr style="margin: 3px">
						<div class="d-flex" style="align-items: center;">
							<div class=" flex-grow-1">
								<b>Grand Total Amount</b>
							</div>
							<!-- <div class="pd-10">Flex item</div> -->
							<div class=" mg-l-auto">
								<b>Rs :</b>
								<b class="giraviMainGrandAmt">0.00</b>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="col-md-12">
			<div class="accordion mg-t-20 accordion-style1">
				<h6 class="recipientDescCollapse">Write a description to the recipient (will be printed at the footer of an giravi).......</h6>
				<div style="padding: 0;">
					<textarea class="form-control recipientDesc" style="border: 0; border-top: 1px solid #e6e6e6;" rows="4" placeholder="Write a description to the recipient..."></textarea>
				</div>
			</div>
		</div> -->
		<div class="col-md-12">
			<hr>
			<div style="float: right;" class="hide">
				<button type="button" class="btn btn-white" onclick="cancelGiravi()">Cancel</button>
				<button type="button" data-flag="N" class="btn btn-primary giraviSave" id="giraviSaveBtn" onclick="saveGiravi(this)" disabled>Save Giravi</button>
			</div>
		</div>
	</div>
	<jsp:include page="AddGiraviItemFormModal.jsp"></jsp:include>
	<jsp:include page="AddGiraviCategoryFormModal.jsp"></jsp:include>
	<jsp:include page="AddGiraviCustomerFormModal.jsp"></jsp:include>
	<script type="text/javascript">
		function manageColumn(obj,colName){
			if($(obj).is(':checked')){
				$('.giraviItemsTable').find('.col-'+colName).removeClass('hide');
				if(colName=='hsn'){
					$('.giraviItemsTable').find('.totalTr th:eq(0)').attr('colspan','3');
				}
			}else{
				$('.giraviItemsTable').find('.col-'+colName).addClass('hide');
				if(colName=='hsn'){
					$('.giraviItemsTable').find('.totalTr th:eq(0)').attr('colspan','2');
				}
			}
		}
	
	
		$(function(){

			$('.parsleyField.mandatory').parsley();

			
			$('.accordion').accordion({
			  heightStyle: 'content',
			  collapsible: true
			});
			
			$('.recipientDescCollapse').click();
			$('.recipientDesc').val('1.\n2.\n3.\n4.')
			
			$('.giraviDate').datepicker({
				  dateFormat: 'dd-mm-yy',
				  showOtherMonths: true,
				  selectOtherMonths: true,
				  changeMonth: true,
				  changeYear: true,
			});

			$('.giraviDate').datepicker().on('changeDate', function(e) {
				$('.giraviDate').parsley();
				$('.giraviDate').change();
		    });
			
			$('.paymentDueDate').datepicker({
				  dateFormat: 'dd-mm-yy',
				  showOtherMonths: true,
				  selectOtherMonths: true,
				  changeMonth: true,
				  changeYear: true
			});


			new Cleave('.dateCleave', {
				 date: true,
				 delimiter: '-',
				 datePattern: ['d', 'm', 'Y']
			});
			 
			
			
			$('.customerSelect').select2({
				width:'100%',
				placeholder: 'Select customer...',
				allowClear: true
			}).on('select2:open', () => { 
				var nn= '<div class="row"><div class="col-sm"><div class="pd-y-10 pd-x-20 bg-ui-01"><a href="javascript:;" onclick="openAddCustomerModal()"><i class="icon ion-md-add"></i> Add new customer</a></div></div></div>';
		        $(".select2-results:not(:has(a))").append(nn);
			}).on('change', function(){
				if($(this).val()!=null && $(this).val()!=""){
					var cusOb = $(this).find('option:selected').data('obj');
					console.log('cusOb',cusOb)
					var cus = '<h4 style="color: #717171;">'+cusOb.cusName+'</h4><div> '+cusOb.mobile+'</div><div>'+cusOb.cusAddrL1+',</div><div>'+cusOb.cusAddrL2+' '+cusOb.city+'</div><div> Pin '+cusOb.pincode+'</div><div>'+cusOb.state+'</div><div> <span><a href="javascript:;" onclick="editCustomer()">Edit Customer</a></span></div>';
					$('.billToDetail').empty().append(cus);
					$('.billToDetail').siblings('.form-group').addClass('hide');
				}else{
					$('.billToDetail').siblings('.form-group').removeClass('hide');
					$('.billToDetail').empty();
				}
			}).val(null).trigger('change');
			
			
			//width: 287.5px;
			
			if($('.giraviItemsTable tbody tr').length<=0){
				$('.giraviItemsTable tbody').append('<tr class="noDataTr">'+
						'<th colspan="10" style="text-align: center; padding: 20px 0px;"><i class="fa fa-plus hide"></i>&nbsp; &nbsp; No item found</th></tr>')
			}
			
		});
		
		
		function openAddGiraviItemModal() {
			clearGiraviItemForm();
			$('#modalAddGiraviItem').modal('toggle');
			//$('#giraviItemForm').parsley().validate();
		}

		
		function openItemModal(){
			clearItemForm($('#itemForm')); //function written in include jsp files
			$('#modalAddGiraviItem').modal('toggle');
			$('#modalAddItem').modal('toggle');
		}
		
		function openCategoryModal(){
			clearCategoryForm($('#categoryForm')); //function written in include jsp files
			$('#modalAddItem').modal('toggle');
			$('#modalAddCategory').modal('toggle');
			$('#categoryForm').find('.categoryName').focus();
		}
		
		function openDiscountEntryModal(){
			clearDiscountForm($('#discountForm'));
			$('#modalAddGiraviItem').modal('toggle');
			$('#modalAddDiscount').modal('toggle');
		}
		
		function openTaxEntryModal(){
			clearTaxForm($('#taxForm'));
			$('#modalAddGiraviItem').modal('toggle');
			$('#modalAddTax').modal('toggle');
		}

		function openAddCustomerModal(){
			clearCustomerForm($('#customerForm'));
			$(".customerSelect").select2("close");
			$('#modalAddCustomer').modal('toggle');
		}
		
		
		

		
		
		function updateTableSerialNumber(){
			$('.giraviItemsTable tbody tr').each(function(i,trObj){
				$(trObj).find('.trCount').text(i+1)
			});
		}
		
		function updateTfootTotal(){
			
			var qtyTot = 0.00;
			var upTot = 0.00;
			var taTot = 0.00;
			var dTot = 0.00;
			var taxAmtTot = 0.00;
			var taxTot = 0.00;
			var discTot = 0.00;
			
			$('.giraviItemsTable tbody tr').each(function(i,trObj){
				//$(trObj).find('.trCount').text(i+1)
				qtyTot = qtyTot + parseFloat($(this).find('.itemQtyTd span').text());
				upTot = upTot + parseFloat($(this).find('.itemUPTd span').text());
				taTot = taTot + parseFloat($(this).find('.itemTATd span').text());
				dTot = dTot + parseFloat($(this).find('.itemDisTd .discamt').text());
				taxAmtTot = taxAmtTot + parseFloat($(this).find('.itemTaxAmtTd .txamt').text());
				taxTot = taxTot + parseFloat($(this).find('.itemTaxTd .rowTaxTotAmt').text());
				discTot = discTot + parseFloat($(this).find('.itemTaxTd .rowDiscTotAmt').text());
			});
			
			$('.giraviItemsTable tfoot').find('.totalTr').find('.qtyTotTfoot span:eq(0)').text(qtyTot.toFixed(2));
			$('.giraviItemsTable tfoot').find('.totalTr').find('.upTotTfoot span:eq(0)').text(upTot.toFixed(2));
			$('.giraviItemsTable tfoot').find('.totalTr').find('.taTotTfoot span:eq(0)').text(taTot.toFixed(2));
			$('.giraviItemsTable tfoot').find('.totalTr').find('.dTotTfoot span:eq(0)').text(dTot.toFixed(2));
			$('.giraviItemsTable tfoot').find('.totalTr').find('.taxAmtTotTfoot span:eq(0)').text(taxAmtTot.toFixed(2));
			$('.giraviItemsTable tfoot').find('.totalTr').find('.taxTotTfoot span:eq(0)').text(taxTot.toFixed(2));
			
			var giraviMainGrandAmt = (taTot + taxTot)-dTot;
			
			$('.giraviMainTotAmt').text(taTot.toFixed(2));
			$('.giraviMainTaxAmt').text(taxTot.toFixed(2));
			$('.giraviMainDisAmt').text(discTot.toFixed(2));
			$('.giraviMainGrandAmt').text(giraviMainGrandAmt.toFixed(2));
			
			
			if($('.giraviItemsTable tfoot').find('.totalTr').hasClass('hide')){
				$('.giraviItemsTable tfoot').find('.totalTr').removeClass('hide');
			}
		}
		                                                                                                                                                                                                                    
		function deleteGiraviItm(obj,flag){
			var trObj = $(obj).closest('tr');
			//substractTfootTotal(trObj)
			$(trObj).remove();
			
			if($('.giraviItemsTable tbody tr').length>0){
				$('.giraviItemsTable tbody tr').each(function(i,trObj){
					$(trObj).find('.trCount').text(i+1)
				});
				updateTfootTotal();
			}else{
				$('.giraviItemsTable tfoot').find('.totalTr').addClass('hide');
				$('.giraviItemsTable tbody').append('<tr class="noDataTr">'+
				'<th colspan="10" style="text-align: center; padding: 20px 0px;"><i class="fa fa-plus hide"></i>&nbsp; &nbsp; No item found</th></tr>');
			}
			
		}
		
		
		
		
		function editCustomer(){
			$('.billToDetail').empty();
			$('.billToDetail').siblings('.form-group').removeClass('hide');
			$('.customerSelect').val(null).trigger('change');
			$('.customerSelect').select2('open');
		}

		function cancelGiravi(){
			reloadPage();
		}

		function clearGiravi(){
			$('.containtStart').find('input').val('');
			$('.containtStart').find('select').val(null).trigger('change');
			$('.bottom-total-group').find('.giraviMainTotAmt').text('0.00');    
			$('.bottom-total-group').find('.giraviMainDisAmt').text('0.00');    
			$('.bottom-total-group').find('.giraviMainTaxableAmt').text('0.00');
			$('.bottom-total-group').find('.giraviMainTaxAmt').text('0.00');    
			$('.bottom-total-group').find('.giraviMainGrandAmt').text('0.00');  
			$('.giraviItemsTable tbody').empty();
			$('.giraviItemsTable tfoot').find('.totalTr').addClass('hide');
			$('.giraviItemsTable tbody').append('<tr class="noDataTr">'+
			'<th colspan="10" style="text-align: center; padding: 20px 0px;"><i class="fa fa-plus hide"></i>&nbsp; &nbsp; No item found</th></tr>');
			$('.billToDetail').siblings('.form-group').removeClass('hide');
			$('.billToDetail').empty();
			$('.recipientDesc').val('1.\n2.\n3.\n4.')


			$('.containtStart').find('input').val('');
			$('.containtStart').find('select').val('');
			$('.containtStart').find('.select2-hidden-accessible').val(null).trigger('change');
			$('.containtStart').find('textarea').val('');
			$('.containtStart').find('.alert').remove();
			$('.containtStart').find('.select2-hidden-accessible').removeClass('parsley-error');
			$('.containtStart').find('.parsley-error').removeClass('parsley-error');
			$('.containtStart').find('.parsley-success').removeClass('parsley-success');
			$('.containtStart').find('.select2-selection').removeClass('parsley-error');

			$('#giraviId').val(0);
			$('#giraviFlag').val('N');


			//$('.containtStart').find('.giraviSave').attr('onclick',"saveItem(this,'N')");
			$('.containtStart').find('.giraviSave').removeClass('btn-danger').addClass('btn-primary');
			$('.containtStart').find('.giraviSave').text('Save Giravi');
			$('.containtStart').find('.giraviSave').prop('disabled',true);
			$('.parsleyField.mandatory').parsley();
		}


		function saveGiravi(btnObj){

			if($('.giraviItemsTable tbody tr').length == 0 || $('.giraviItemsTable tbody').find('.noDataTr').length){
				alert('Please add items to giravi');
				return;
			}
			
			var soldItems = [];
			$('.giraviItemsTable tbody tr').each(function(i,tr){
				soldItems.push(JSON.parse($(tr).find('.rowItemObj').text()));
			});

			
			var formData = {
					'giraviId'   : $('#giraviId').val(),
					'flag'        : $('#giraviFlag').val(),
					'items'       : JSON.stringify(soldItems),
					'customerId'  : $('.customer-form-group').find('.customerSelect').val(),
					'invNo'       : $('.giravi-detail-group').find('.giraviNum').val(),
					'invDate'     : $('.giravi-detail-group').find('.giraviDate').val(),
					'posoNo'      : $('.giravi-detail-group').find('.posonum').val(),
					'payDueDate'  : $('.giravi-detail-group').find('.paymentDueDate').val(),
					'invAmt'      : $('.bottom-total-group').find('.giraviMainTotAmt').text(),
					'discountAmt' : $('.bottom-total-group').find('.giraviMainDisAmt').text(),
					'taxableAmt'  : $('.bottom-total-group').find('.giraviMainTaxableAmt').text(),
					'taxAmt'      : $('.bottom-total-group').find('.giraviMainTaxAmt').text(),
					'grndTotAmt'  : $('.bottom-total-group').find('.giraviMainGrandAmt').text(),
					'recipientDesc' : $('.recipientDesc').val()
			}
			
			
			//console.log('giravi formData:',formData);


			$.ajax({
				url : '/sales/saveUpdateDeleteSalesOrder',
				method : 'POST',
				data : formData,
				async : false,
				success : function(resp) {
					console.log('resp',resp);
					if(resp.status=="success"){
						clearGiravi();
						alert(resp.msg,'S');
						//needReloadItem=true;
						//clearItemForm($('#itemForm'));
						//$('#modalAddItem').find('.modal-content').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">'+
					    //'<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
					}else{
						alert(resp.msg,'E');
						//needReloadItem=false;
						//$('#modalAddItem').find('.modal-content').find('.alert').remove();
						//$('#modalAddItem').find('.modal-content').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">'+
			            //'<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
					}
				}
			});
			
			
		}

		$('.customer-form-group, .giravi-detail-group').find('.form-control.mandatory').on('change input keyup', function(){
			setTimeout(function(){
				var parsleyFieldLength = $('.customer-form-group, .giravi-detail-group').find('.parsleyField.mandatory').length;
				console.log('parsleyFieldLength',parsleyFieldLength)
				console.log('parsleyFieldLengthsuccess',$('.customer-form-group, .giravi-detail-group').find('.parsley-success').length)
			    var isValidForm = false;
				if($('.customer-form-group, .giravi-detail-group').find('.parsley-success').length==parsleyFieldLength){
					isValidForm = true;
				}else{
					isValidForm = false;
				}
				if(isValidForm){
					$('#giraviSaveBtn').prop('disabled',false);
				}else{
					$('#giraviSaveBtn').prop('disabled',true);
				}

			},10);
		}); 

	

	</script>
	<script type="text/javascript">

	
	
	/* function addTfootTotal(){
	var taxAmt = $('#salesGiraviItemForm').find('.modalTotTaxAmt').text();

	var OqtyTotTfoot =    	parseFloat($('.giraviItemsTable tfoot').find('.totalTr').find('.qtyTotTfoot span:eq(0)').text())+parseFloat($('#salesGiraviItemForm').find('.qty').val());
	var OupTotTfoot = 		parseFloat($('.giraviItemsTable tfoot').find('.totalTr').find('.upTotTfoot span:eq(0)').text())+parseFloat($('#salesGiraviItemForm').find('.unitPrice').val());
	var OtaTotTfoot = 		parseFloat($('.giraviItemsTable tfoot').find('.totalTr').find('.taTotTfoot span:eq(0)').text())+parseFloat($('#salesGiraviItemForm').find('.modalTotAmt').text());
	var OdTotTfoot = 		parseFloat($('.giraviItemsTable tfoot').find('.totalTr').find('.dTotTfoot span:eq(0)').text())+parseFloat($('#salesGiraviItemForm').find('.modalDiscountAmt').text());
	var OtaxAmtTotTfoot = 	parseFloat($('.giraviItemsTable tfoot').find('.totalTr').find('.taxAmtTotTfoot span:eq(0)').text())+parseFloat($('#salesGiraviItemForm').find('.modalTotAmt').text());
	var OtaxTotTfoot = 		parseFloat($('.giraviItemsTable tfoot').find('.totalTr').find('.taxTotTfoot span:eq(0)').text())+parseFloat(taxAmt);
	
	$('.giraviItemsTable tfoot').find('.totalTr').find('.qtyTotTfoot span:eq(0)').text(OqtyTotTfoot.toFixed(2));
	$('.giraviItemsTable tfoot').find('.totalTr').find('.upTotTfoot span:eq(0)').text(OupTotTfoot.toFixed(2));
	$('.giraviItemsTable tfoot').find('.totalTr').find('.taTotTfoot span:eq(0)').text(OtaTotTfoot.toFixed(2));
	$('.giraviItemsTable tfoot').find('.totalTr').find('.dTotTfoot span:eq(0)').text(OdTotTfoot.toFixed(2));
	$('.giraviItemsTable tfoot').find('.totalTr').find('.taxAmtTotTfoot span:eq(0)').text(OtaxAmtTotTfoot.toFixed(2));
	$('.giraviItemsTable tfoot').find('.totalTr').find('.taxTotTfoot span:eq(0)').text(OtaxTotTfoot.toFixed(2));
	
	var giraviMainTotAmt =    parseFloat($('.giraviMainTotAmt').text())+parseFloat($('#salesGiraviItemForm').find('.modalTotAmt').text());
	var giraviMainTaxAmt =    parseFloat($('.giraviMainTaxAmt').text())+parseFloat(taxAmt);
	var giraviMainDisAmt =    parseFloat($('.giraviMainDisAmt').text())+parseFloat($('#salesGiraviItemForm').find('.modalDiscountAmt').text());
	var giraviMainGrandAmt =  parseFloat($('.giraviMainGrandAmt').text())+parseFloat($('#salesGiraviItemForm').find('.modalGrandTotAmt').text());
	
	$('.giraviMainTotAmt').text(giraviMainTotAmt.toFixed(2));
	$('.giraviMainTaxAmt').text(giraviMainTaxAmt.toFixed(2));
	$('.giraviMainDisAmt').text(giraviMainDisAmt.toFixed(2));
	$('.giraviMainGrandAmt').text(giraviMainGrandAmt.toFixed(2));
	
	
	if($('.giraviItemsTable tfoot').find('.totalTr').hasClass('hide')){
		$('.giraviItemsTable tfoot').find('.totalTr').removeClass('hide');
	}
	
}  */

/* function substractTfootTotal(trObj){
	var OqtyTotTfoot =    	parseFloat($('.giraviItemsTable tfoot').find('.totalTr').find('.qtyTotTfoot span:eq(0)').text())-parseFloat($(trObj).find('.itemQtyTd span:eq(0)').text());
	var OupTotTfoot = 		parseFloat($('.giraviItemsTable tfoot').find('.totalTr').find('.upTotTfoot span:eq(0)').text())-parseFloat($(trObj).find('.itemUPTd span:eq(0)').text());
	var OtaTotTfoot = 		parseFloat($('.giraviItemsTable tfoot').find('.totalTr').find('.taTotTfoot span:eq(0)').text())-parseFloat($(trObj).find('.itemTATd span:eq(0)').text());
	var OdTotTfoot = 		parseFloat($('.giraviItemsTable tfoot').find('.totalTr').find('.dTotTfoot span:eq(0)').text())-parseFloat($(trObj).find('.itemDisTd span:eq(0)').text());
	var OtaxAmtTotTfoot = 	parseFloat($('.giraviItemsTable tfoot').find('.totalTr').find('.taxAmtTotTfoot span:eq(0)').text())-parseFloat($(trObj).find('.itemTaxAmtTd span:eq(0)').text());
	var OtaxTotTfoot = 		parseFloat($('.giraviItemsTable tfoot').find('.totalTr').find('.taxTotTfoot span:eq(0)').text())-parseFloat($(trObj).find('.itemTaxTd .rowTaxTotAmt').text()==""?"0.00":$(trObj).find('.itemTaxTd .rowTaxTotAmt').text());

	$('.giraviItemsTable tfoot').find('.totalTr').find('.qtyTotTfoot span:eq(0)').text(OqtyTotTfoot.toFixed(2));
	$('.giraviItemsTable tfoot').find('.totalTr').find('.upTotTfoot span:eq(0)').text(OupTotTfoot.toFixed(2));
	$('.giraviItemsTable tfoot').find('.totalTr').find('.taTotTfoot span:eq(0)').text(OtaTotTfoot.toFixed(2));
	$('.giraviItemsTable tfoot').find('.totalTr').find('.dTotTfoot span:eq(0)').text(OdTotTfoot.toFixed(2));
	$('.giraviItemsTable tfoot').find('.totalTr').find('.taxAmtTotTfoot span:eq(0)').text(OtaxAmtTotTfoot.toFixed(2));
	$('.giraviItemsTable tfoot').find('.totalTr').find('.taxTotTfoot span:eq(0)').text(OtaxTotTfoot.toFixed(2));
	
	var giraviMainTotAmt =    parseFloat($('.giraviMainTotAmt').text())-parseFloat($(trObj).find('.itemTATd span:eq(0)').text());
	var giraviMainTaxAmt =    parseFloat($('.giraviMainTaxAmt').text())-parseFloat($(trObj).find('.itemTaxTd .rowTaxTotAmt').text()==""?"0.00":$(trObj).find('.itemTaxTd .rowTaxTotAmt').text());
	var giraviMainDisAmt =    parseFloat($('.giraviMainDisAmt').text())-parseFloat($(trObj).find('.itemDisTd span:eq(0)').text());
	var giraviMainGrandAmt =  parseFloat($('.giraviMainGrandAmt').text())-parseFloat($(trObj).find('.itemGrandAmt').text());
	
	$('.giraviMainTotAmt').text(giraviMainTotAmt.toFixed(2));
	$('.giraviMainTaxAmt').text(giraviMainTaxAmt.toFixed(2));
	$('.giraviMainDisAmt').text(giraviMainDisAmt.toFixed(2));
	$('.giraviMainGrandAmt').text(giraviMainGrandAmt.toFixed(2));
}    */     
	</script>
</body>
</html>