<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="modal" id="modalGiraviTransactionModal" role="dialog" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog" role="document" style="max-width: 850px;">
		<div class="modal-content">
			<div class="modal-header pd-x-20 pd-sm-x-30">
				<a href="" role="button" class="close pos-absolute t-15 r-15"
					data-dismiss="modal" aria-label="Close"> <span
					aria-hidden="true">×</span>
				</a>
				<div class="media align-items-center">
					<span class="tx-color-03 d-none d-sm-block"> <i
						data-feather="box"></i>
					</span>
					<div class="media-body mg-sm-l-20">
						<h4 class="tx-18 tx-sm-20 mg-b-2">
							All Transactions For Giravi No : <i class="giraviNo">${giraviNumber }</i>
						</h4>
						
					</div>
				</div>
			</div>
			<div class="modal-body pd-10">
				<div class="">
					<c:set var="totAmt" value="0"></c:set>
					<table class="table giraviTransactionTable" id="giraviTransactionTable">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Date</th>
								<th scope="col">Amount</th>
								<th scope="col">Method</th>
								<th scope="col">Description</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="rCount" value="0"></c:set>
							<c:forEach items="${giraviTransactions}" var="tran">
								<c:set var="rCount" value="${rCount+1 }"></c:set>
								<c:set var="totAmt" value="${totAmt +  tran.tranAmount}"></c:set>
								<tr>
									<td scope="col" class="">${rCount}</td>
									<td scope="col" class=""><fmt:formatDate
											pattern="dd-MM-yyyy" value="${tran.tranDate}" /></td>
									<td scope="col" class="right bold">${tran.tranAmount}</td>
									<td scope="col" class="">${tran.tranMethod}</td>
									<td scope="col" class="">${tran.tranDesc}</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th scope="col" colspan="2" class="right">Total Amount Paid: </th>
								<th scope="col" class="right">${totAmt }</th>
								<th scope="col"></th>
								<th scope="col"></th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$('#giraviTransactionTable').DataTable({
			language : {
				searchPlaceholder : 'Search transaction...',
				sSearch : '',
				lengthMenu : '_MENU_ per/page',
			},
			"initComplete":function(){
				
				$('#modalGiraviTransactionModal').find('.dataTables_filter').append('<div class="input-group" style="float: left;width: auto;    margin-right: 10px;">'+
						  '<input type="text" class="fromDateFilter" placeholder="From Date" style="width: 115px;">'+
						  '<div class="input-group-append">'+
						  '<span class="input-group-text" style="background-color: #fff;"><i class="fa fa-calendar"></i></span></div></div>'+
						  '<div class="input-group" style="float: left;width: auto;    margin-right: 10px;">'+
						  '<input type="text" class="toDateFilter" placeholder="To Date" style="width: 115px;">'+
						  '<div class="input-group-append">'+
						  '<span class="input-group-text" style="background-color: #fff;"><i class="fa fa-calendar"></i></span></div></div>');
				feather.replace();
				$('.dataTables_length').find('select').select2({minimumResultsForSearch: -1});
				$('table.dataTable').css("padding","0px");
				$('table.dataTable').css("border-top","1px solid #e2e2e2");
			}
		});

		

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
	});
</script>