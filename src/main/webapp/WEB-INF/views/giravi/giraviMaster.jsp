<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.dataTables_length{
	width: 16%;
}

.dataTables_filter{
	width: 84%;
}

.dataTables_wrapper .dataTables_filter label {
    display: unset !important;
}
</style>
</head>
<body>
	<div class="row invoiceTable">
		<div class="col-md-12">
			<ul class="nav nav-line" id="myTab6" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="allGiravi-tab5" data-toggle="tab" href="#allGiraviTabPane" role="tab" aria-controls="allGiravi" aria-selected="true">All Giravi</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="paidGiravi-tab5" data-toggle="tab" href="#paidGiraviTabPane" role="tab" aria-controls="paidGiravi" aria-selected="false">Paid Giravi</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="unpaidGiravi-tab5" data-toggle="tab" href="#unpaidGiraviTabPane" role="tab" aria-controls="unpaidGiravi" aria-selected="false">Unpaid Giravi</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="draftGiravi-tab5" data-toggle="tab" href="#draftGiraviTabPane" role="tab" aria-controls="draftGiravi" aria-selected="false">Draft Giravi</a>
				</li>
				<li class="float-right" style="margin-left: auto;"><a href="javascript:;" style="float: right;" onclick="viewGiraviForm(this,'N')" class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5">
								<i class="fa fa-plus"></i> Add New Giravi</a></li>
			</ul>
			<div class="tab-content mg-t-20" id="myTabContent6">
				<div class="tab-pane fade active show" id="allGiraviTabPane" role="tabpanel" aria-labelledby="allGiravi-tab6">
					<h6>All Giravi</h6>
					<table class="table allGiraviTable" id="allGiraviTable">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Giravi No</th>
								<th scope="col">Giravi Date</th>
								<th scope="col">Giravi Amount</th>
								<th scope="col">Customer</th>
								<th scope="col">Payment Status</th>
								<th scope="col">Pay Now</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="rCount" value="0"></c:set>
							<c:forEach items="${salesInvoiceList}" var="inv">
								<c:set var="rCount" value="${rCount+1 }"></c:set>
								<tr>
									<td scope="col" class="">${rCount}</td>
									<td scope="col" class="">${inv.invNum}</td>
									<td scope="col" class="">${inv.invDate}</td>
									<td scope="col" class="">${inv.invVal}</td>
									<td scope="col" class="">${inv.customer.cusName} <input type="hidden" class="customerId" value="${inv.customer.id}"></td>
									<td scope="col" class=""></td>
									<td scope="col" class=""></td>
									<td scope="col" class="">
										<span class="invId hide">${inv.id}</span>
										<div class="text-center">
											<button type="button" onclick="viewGiraviForm(this,'M')" data-invid="${inv.id}" data-customerId="${inv.customer.id}" class="btn btn-success btn-icon btn-sm">
												<i data-feather="edit-3"></i>
											</button>
											<button type="button" onclick="viewGiraviForm(this,'D')" data-invid="${inv.id}" data-customerId="${inv.customer.id}" class="btn btn-danger btn-icon btn-sm">
												<i data-feather="trash-2"></i>
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="paidGiraviTabPane" role="tabpanel" aria-labelledby="paidGiravi-tab6">
					<h6>Paid Giravi</h6>
				</div>
				<div class="tab-pane fade" id="unpaidGiraviTabPane" role="tabpanel" aria-labelledby="unpaidlGiravi-tab6">
					<h6>Unpaid Giravi</h6>
				</div>
				<div class="tab-pane fade" id="draftGiraviTabPane" role="tabpanel" aria-labelledby="draftlGiravi-tab6">
					<h6>Draft Giravi</h6>
				</div>
			</div>
		</div>
	</div>
	
	<div class="invoiceForm hide">
		<jsp:include page="giraviMasterForm.jsp"></jsp:include>
	</div>
	
	<script src="lib/datatable/js/jquery.dataTables.yadcf.0.9.2.js"></script>
	<script type="text/javascript">
	var allGiraviTable=null;
	var paidGiraviTable=null;
	var unpaidGiraviTable=null;
	var draftGiraviTable=null;
	var needReloadAllGiravi = false;
	var needReloadPaidGiravi = false;
	var needReloadUnpaidGiravi = false;
	var needReloadDraftGiravi = false;
	
	var minDateFilter = "";
	var maxDateFilter = "";
	
	$(function(){
        'use strict'
        
        //
        if ($.fn.dataTable.isDataTable( '.allGiraviTable' )){
        	allGiraviTable = $('.allGiraviTable').DataTable();
		}else{
			allGiraviTable = $('.allGiraviTable').DataTable({
		    	language : {
					searchPlaceholder : 'Search anything...',
					sSearch : '',
					lengthMenu : '_MENU_ giravi/page',
				},
				"initComplete":function(){
				
					$('#allGiraviTabPane').find('.dataTables_filter').append('<div class="input-group" style="float: left;width: auto;    margin-right: 10px;">'+
							  '<input type="text" class="fromDateFilter" placeholder="From Date" style="width: 115px;">'+
							  '<div class="input-group-append">'+
							  '<span class="input-group-text" style="background-color: #fff;"><i class="fa fa-calendar"></i></span></div></div>'+
							  '<div class="input-group" style="float: left;width: auto;    margin-right: 10px;">'+
							  '<input type="text" class="toDateFilter" placeholder="To Date" style="width: 115px;">'+
							  '<div class="input-group-append">'+
							  '<span class="input-group-text" style="background-color: #fff;"><i class="fa fa-calendar"></i></span></div></div>'+
							'<a href="javascript:;" style="float: right;" onclick="reloadPage()" class="btn btn-sm pd-x-15 btn-white btn-uppercase mg-l-5 float-right">'+
							'<i data-feather="refresh-cw"></i></a>');
					feather.replace();
					
				}
		    });
		}
        
		
		 $('.fromDateFilter').datepicker({
			  dateFormat: 'dd-mm-yy',
			  showOtherMonths: true,
			  selectOtherMonths: true,
			  changeMonth: true,
			  changeYear: true,
			  "onSelect": function(date) {
			      minDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(date).getTime();
			      allGiraviTable.draw();
			  }
		}).keyup(function() {
		    minDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(this.value).getTime();
		    allGiraviTable.draw();
		});
        
        $('.toDateFilter').datepicker({
			  dateFormat: 'dd-mm-yy',
			  showOtherMonths: true,
			  selectOtherMonths: true,
			  changeMonth: true,
			  changeYear: true,
			  "onSelect": function(date) {
				  maxDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(date).getTime();
			      allGiraviTable.draw();
			  }
		}).keyup(function() {
			maxDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(this.value).getTime();
		    allGiraviTable.draw();
		});
        
        $('.dataTables_length').find('select').select2({minimumResultsForSearch: -1});
        
       
	});
	
	function viewGiraviForm(btnObj, flg){
		if(flg !="N"){
			var invid = $(btnObj).data('invid');
			var customerid = $(btnObj).data('customerid');
			loadGiraviForUpdateDeleteByGiraviId(invid,customerid);
		}else{
			$('.invoiceTable').toggleClass('hide');
			$('.invoiceForm').toggleClass('hide');
		}
		
	}

	function loadGiraviForUpdateDeleteByGiraviId(invid,customerid){
		$.ajax({
			url : '/sales/getSalesOrderById',
			method : 'POST',
			data : {
				'invid' : invid,
				'customerid' : customerid
			},
			async : false,
			success : function(resp) {
				console.log('loadGiraviForUpdateDeleteByGiraviId resp',resp);
				if(resp && resp.data){
					var itemObj = {};
					var itemId = 0;
					$('.invoiceItemsTable tbody').find('.noDataTr').remove();

					$('#invoiceId').val();
					$('#invoiceFlag').val();
					$('.customer-form-group').find('.customerSelect').val(customerid).trigger('change');
					$('.invoice-detail-group').find('.invoiceNum').val(resp.data.invNum);
					$('.invoice-detail-group').find('.invoiceDate').val(resp.data.invDate);
					$('.invoice-detail-group').find('.posonum').val(resp.data.posoNum);
					$('.invoice-detail-group').find('.paymentDueDate').val(resp.data.payDueDate);
					$('.bottom-total-group').find('.invoiceMainTotAmt').text(resp.data.invVal);
					$('.bottom-total-group').find('.invoiceMainDisAmt').text(0);
					$('.bottom-total-group').find('.invoiceMainTaxableAmt').text(resp.data.taxableVal);
					$('.bottom-total-group').find('.invoiceMainTaxAmt').text(resp.data.taxVal);
					$('.bottom-total-group').find('.invoiceMainGrandAmt').text(0);
					$('.recipientDesc').text(resp.data.recipientDesc);
					
					$.each(resp.data.items,function(i,itm){
						console.log('found itm::',itm);
						itemObj.id = itm.id;
						itemObj.invItemid = itm.inventoryItemId;
						itemObj.categoryid = itm.categoryId ? itm.categoryId: "";
						itemObj.name = itm.itemName ? itm.itemName : "";
						itemObj.hsn = itm.hsnNo ? itm.hsnNo : "";
						itemObj.qty = itm.qty ? itm.qty : "0.00";
						itemObj.mu = itm.measurementUnit ? itm.measurementUnit : "";
						itemObj.uPrice = itm.unitAmt ? itm.unitAmt : "0.00";
						itemObj.qtyAmt = itm.qtyAmt ? itm.qtyAmt : "0.00";
						itemObj.discAmt = itm.discountVal ? itm.discountVal : "0.00";
						itemObj.taxableAmt =  itm.taxableAmt ? itm.taxableAmt : "0.00";
						itemObj.totAmt = itm.totalAmt ? itm.totalAmt : "0.00";
						itemObj.taxArr = itm.taxes ? itm.taxes : null;
						itemObj.discArr = itm.discounts ? itm.discounts : null;

						console.log('itemObj',itemObj)
						var qty = itemObj.qty == "" ? 0 : itemObj.qty;
						var uPrice = itemObj.uPrice == "" ? "0.00" : itemObj.uPrice;
						var rowCount = i+1;


						var discPercentArry = itemObj.discArr;
						var discTd = "";
						var discObjArray = [];
						var rowDiscTotAmt = 0;
						if (discPercentArry.length > 0) {
							discPercentArry.forEach(function (objDisc, i) {
								var discr = objDisc.discountRateInPercent;
								var discAmtNew = parseFloat(discr) / 100;
								discTd = discTd + '<span> Rs: <b class="discamt">' + (discAmtNew * parseFloat(itemObj.qtyAmt)) + '</b></span>';
								rowDiscTotAmt = rowDiscTotAmt + (discAmtNew * parseFloat(itemObj.qtyAmt));
							});
						}

						discTd = discTd + '<small class="hide rowDiscTotAmt">' + rowDiscTotAmt + '</small>';


						var taxPercentArry = itemObj.taxArr;
						var taxTd = "";
						var taxObjArray = [];
						var rowTaxTotAmt = 0;
						if (taxPercentArry.length > 0) {
							taxPercentArry.forEach(function (objTx, i) {
								var txr = objTx.taxRate;
								var txName = objTx.taxName;
								var taxAmtNew = parseFloat(txr) / 100;
								taxTd = taxTd + '<span>' + txName + ' Rs: <b class="txamt">' + (taxAmtNew * parseFloat(resp.data.taxableVal)) + '</b></span>';
								rowTaxTotAmt = rowTaxTotAmt + (taxAmtNew * parseFloat(resp.data.taxableVal));
							});
						}

						taxTd = taxTd + '<small class="hide rowTaxTotAmt">' + rowTaxTotAmt + '</small>';

						var tr = ' <tr>' +
						' <td class="trCount">' + (rowCount) + '</td>' +
						' <td class="itemNameTd">' + itemObj.name + '</td>' +
						' <td class="itemHSNTd col-hsn">' + itemObj.hsn + '</td>' +
						' <td class="itemQtyTd"><span>' + itemObj.qty + '</span> ' + itemObj.mu + '</td>' +
						' <td class="itemUPTd col-up">Rs: <span>' + itemObj.uPrice + '</span></td>' +
						' <td class="itemTATd">Rs: <span>' + itemObj.qtyAmt + '</span></td>' +
						' <td class="itemDisTd col-disc">' + discTd + '</td>' +
						' <td class="itemTaxAmtTd">Rs: <span>' + itemObj.taxableAmt + '</span></td>' +
						' <td class="itemTaxTd col-tax">' + taxTd + '</td>' +
						' <td class="">' +
						'<span class="itemGrandAmt hide">' + itemObj.totAmt + '</span>' +
						'<span class="itemId hide">' + itemObj.invItemid + '</span>' +
						'<span class="rowTaxObjArray hide">' + (JSON.stringify(itemObj.taxArr)) + '</span>' +
						'<span class="rowDiscountObjArray hide">' + (JSON.stringify(itemObj.discArr)) + '</span>' +
						'<span class="rowItemObj hide">' + (JSON.stringify(itemObj)) + '</span>' +
						'<div class="text-center">' +
						'<button type="button" onclick=updateGiraviItm(this) class="btn btn-success btn-icon btn-sm editBtn">' +
						'<i data-feather="edit-3"></i>' +
						'</button>' +
						'<button type="button" onclick=deleteGiraviItm(this) class="btn btn-danger btn-icon btn-sm deleteBtn">' +
						'<i data-feather="trash-2"></i>' +
						'</button>' +
						'</div>' +
						'</td></tr>';

						$('.invoiceItemsTable tbody').append(tr);
						updateTfootTotal();
						feather.replace();
					});

					$('.invoiceTable').toggleClass('hide');
					$('.invoiceForm').toggleClass('hide');
				}
			}
		});
	}
	
	
	$.fn.dataTableExt.afnFiltering.push(function(oSettings, aData, iDataIndex){
        if(oSettings.sTableId=="allGiraviTable"){
    		if (typeof aData._date == 'undefined') {
  		      aData._date = moment(aData[2], 'DD-MM-YYYY').toDate();//new Date(aData[2]).getTime();
  		    }
    	} 

	    if (minDateFilter && !isNaN(minDateFilter)) {
	      if (aData._date < minDateFilter) {
	        return false;
	      }
	    }

	    if (maxDateFilter && !isNaN(maxDateFilter)) {
	      if (aData._date > maxDateFilter){
	        return false;
	      }
	    }
	    return true;
  	});
	</script>
</body>
</html>