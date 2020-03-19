<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="modal" id="modalAddGiraviItem" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog wd-sm-750" role="document" style="max-width: 661px;">
		<div class="modal-content">
			<form id="giraviItemForm">
				<div class="modal-header pd-x-20 pd-sm-x-30">
					<a href="" role="button" class="close pos-absolute t-15 r-15" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</a>
					<div class="media align-items-center">
						<span class="tx-color-03 d-none d-sm-block">
							<i data-feather="box"></i>
						</span>
						<div class="media-body mg-sm-l-20">
							<h4 class="tx-18 tx-sm-20 mg-b-2">Add Item to giravi</h4>
						</div>
					</div>
				</div>
				<div class="modal-body pd-sm-x-30">
					<div class="form-group mg-b-0">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Enter item name</label> <input type="text" placeholder="Enter Item Name" class="form-control mandatory giraviItemNameInput" required data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="2" data-parsley-minlength-message="Item Name must be valid name.">
						
					</div>
					<div class="row row-sm mg-t-10">
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Select Metal</label> <select onkeyup="" class="form-control mandatory metalSelect" required data-parsley-trigger="keyup">
								<option value="G">Gold</option>
								<option value="G">Silver</option>
							</select>
						</div>
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Quantity</label> <input type="text" class="form-control right mandatory giraviItemQtyInput qtyCleave" placeholder="Enter quantity" required data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter proper quantity ">
						</div>
					</div>
					<div class="row row-sm mg-t-10">
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Gross Weight</label> <input type="text" class="form-control right mandatory grossWeightInput grossWeightCleave" required placeholder="Enter Gross Weight" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter proper weight. ">

						</div>
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Gross Weight Unit</label> <select class="form-control guomSelect">
								<option value="gm" selected>Gram</option>
								<option value="mg">MiliGram</option>
							</select>
						</div>
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Net Weight</label> <input type="text" class="form-control right mandatory netWeightInput grossWeightCleave" required placeholder="Enter Net Weight" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter proper weight. ">

						</div>
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Net Weight Unit</label> <select class="form-control guomSelect">
								<option value="gm" selected>Gram</option>
								<option value="mg">MiliGram</option>
							</select>
						</div>
					</div>
					<div class="row row-sm mg-t-10">
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Valuation Amount</label> <input type="text" class="form-control right valuationInput valuationCleave" required placeholder="Enter Valuation Amount" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter proper amount. ">
						</div>
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Payable Amount</label> <input type="text" onkeyup="calculateTotalInModal()" class="form-control right mandatory payableAmountInput payableAmountCleave" required placeholder="Enter Payable Amount" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter proper amount. ">
						</div>
					</div>
					<div class="modalTotDiv mg-t-20" style="text-align: right;">
						<p class="">
							Total Payable Amount : Rs <b class="modalTotAmt">0.00</b>
						</p>
						<p class="">
							Grand Total Amount : Rs <b class="modalGrandTotAmt">0.00</b>
						</p>
					</div>
					<div class="row row-sm">
						<div class="col-sm mg-t-10" style="text-align: right;">
							<button type="button" class="btn btn-white" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary addItemToGiraviBtn" data-flag="N" onclick="addItemToGiravi(this,'N')" disabled>Add item to giravi</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">

	$(function () {

		//loadAllInventoryItems();
		
	});


	new Cleave('.qtyCleave', {
		numeral: true,
		numeralDecimalScale: 0,
		numeralPositiveOnly: true,
		numeralThousandsGroupStyle: 'lakh',
	});

	new Cleave('.grossWeightCleave', {
		numeral: true,
		numeralDecimalScale: 4,
		numeralThousandsGroupStyle: 'lakh',
		numeralPositiveOnly: true,
	});

	$('#giraviItemForm').find('.discountSelect').select2({
		width: '100%',
		placeholder: 'Select Discount...',
		allowClear: true,
	}).on('select2:open', () => {
		var nn = '<div class="row"><div class="col-sm"><div class="pd-y-10 pd-x-20 bg-ui-01"><a href="javascript:;" onclick="openDiscountEntryModal()"><i class="icon ion-md-add"></i> Create new discount entry</a></div></div></div>';
		$(".select2-results:not(:has(a))").append(nn);
	}).val(null).trigger('change');


	$('#modalAddGiraviItem').on('hidden.bs.modal', function () {
		$('#giraviItemForm').find('.searchInventoryItem').select2('close');
		$('#giraviItemForm').find('.taxSelect').select2('close');
		$('#giraviItemForm').find('.discountSelect').select2('close');
	});


	$('select').on('change', function () {
		if ($(this).val() != null) {
			$(this).trigger('input');
		}
		if ($(this).hasClass('mandatory') && $(this).closest('.parsley-select').find('ul').length > 0) {
			var ul = $(this).closest('.parsley-select').find('ul');
			$(this).closest('.parsley-select').find('ul').remove();
			$(this).closest('.parsley-select').append(ul);
		}
		if ($(this).hasClass('parsley-error') && $(this).hasClass('select2-hidden-accessible')) {
			//console.log('adding parsley-error class to select')
			$(this).removeClass('parsley-error');
			$(this).closest('.parsley-select').find('.select2-selection').removeClass('parsley-success').addClass('parsley-error');
		} else if ($(this).hasClass('parsley-success')) {
			$(this).removeClass('parsley-success');
			$(this).closest('.parsley-select').find('.select2-selection').removeClass('parsley-error').addClass('parsley-success');
		} else {
			$(this).closest('.parsley-select').find('.select2-selection').removeClass('parsley-error').removeClass('parsley-success');
		}
	});


	$('#giraviItemForm').parsley().on('field:validated', function () {
		var parsleyFieldLength = $('#giraviItemForm').find('.mandatory').length;
		//console.log('mandatory length',parsleyFieldLength)
		var isValidForm = false;
		if ($('#giraviItemForm').find('.parsley-success').length == parsleyFieldLength) {
			isValidForm = true;
		} else {
			isValidForm = false;
		}
		if (isValidForm) {
			$('#giraviItemForm').find('.addItemToGiraviBtn').prop('disabled', false);
		} else {
			$('#giraviItemForm').find('.addItemToGiraviBtn').prop('disabled', true);
		}
	}).on('form:submit', function () {
		return false; // Don't submit form for this demo
	});


	function loadAllInventoryItems() {
		var url = '/inventory/getInventoryItems?iid=null';
		$.ajax({
			url: url,
			method: 'POST',
			success: function (resp) {
				console.log('loadAllInventoryItems resp::',resp)
				var options = null;
				(resp.data).forEach(function (itm) {
					console.log('getAllInventoryItems itm :', itm);
					var disabled = "";
					if (parseFloat(itm.mainQty) <= 0) {
						disabled = "disabled";
					}
					options = options + '<option ' + disabled + ' value="' + itm.id + '" data-qty="' + itm.mainQty + '" data-sprice="' + itm.sellingPrice + '" data-lowqty="' + itm.lowStockQty + '" data-brand="' + itm.brand + '" data-mu="' + itm.measurementUnit + '">' + itm.itemName + '</option>';
				});
				$('#giraviItemForm').find('.searchInventoryItem').append(options);


				$('#giraviItemForm').find('.searchInventoryItem').select2({
					width: '100%',
					placeholder: 'Type item name here...',
					allowClear: true,
					templateResult: select2Itemformat,
					escapeMarkup: function (m) {
						return m;
					}
				}).on('select2:open', () => {
					var nn = '<div class="row"><div class="col-sm"><div class="pd-y-10 pd-x-20 bg-ui-01"><a href="javascript:;" onclick="openItemModal()"><i class="icon ion-md-add"></i> Create new inventory item</a></div></div></div>';
					$(".select2-results:not(:has(a))").append(nn);
				}).on("select2:unselecting", function (e) {
					$(this).trigger('input');
				}).on('change', function () {
					if ($(this).val() != '' && $(this).val() != null) {
						//<span class="fieldSuggestionTxt">Avai. Qty : <span class="fieldSuggestionQty"></span> <span class="fieldSuggestionUnit"></span></span>
						/* var exsistingQty = 0;
						var exsistingUnitPrice = 0;
						var exsistingQty = 0;
						var exsistingQty = 0;
						var exsistingQty = 0;
						var exsistingQty = 0;  */
						var isItemAvailInTbl = false;
						var trObj = null;
						$('.giraviItemsTable tbody tr').each(function (i, trObjj) {
							if ($(trObjj).find('.itemId').text() == $('#giraviItemForm').find('.searchInventoryItem').val()) {
								isItemAvailInTbl = true;
								trObj = $(trObjj);
							}
						});

						if (isItemAvailInTbl && $(this).hasClass('newentry')) {
							console.log('found');
							$('#giraviItemForm').find('.qty').val($(trObj).find('.itemQtyTd span').text()).trigger('keyup');
							$('#giraviItemForm').find('.unitPrice').val($(trObj).find('.itemUPTd span').text()).trigger('keyup');

							var taxVal = [];
							if ($.isArray(JSON.parse($(trObj).find('.rowTaxObjArray').text()))) {
								JSON.parse($(trObj).find('.rowTaxObjArray').text()).forEach(function (tax) {
									taxVal.push(tax.taxId);
								});
							}
							$('#giraviItemForm').find('.taxSelect').val(taxVal).trigger('change');
							if ($(trObj).find('.rowDiscountObj').text() != "") {
								var discObj = JSON.parse($(trObj).find('.rowDiscountObj').text());
								$('#giraviItemForm').find('.discountSelect').val(discObj.id).trigger('change');
							} else {
								$('#giraviItemForm').find('.discountSelect').val(null).trigger('change');
							}

							$('#giraviItemForm').find('.addItemToGiraviBtn').attr('onclick', "addItemToGiravi(this,'M')");
							$('#giraviItemForm').find('.addItemToGiraviBtn').data('rowindex', $(trObj).index());
						} else {
							console.log('not found');
							$('#giraviItemForm').find('.qty').val('').trigger('keyup');
							$('#giraviItemForm').find('.taxSelect').val(null).trigger('change');
							$('#giraviItemForm').find('.discountSelect').val(null).trigger('change');
							$('#giraviItemForm').find('.unitPrice').val($(this).find('option:selected').data('sprice')).trigger('keyup');
							$('.select2-search__field').css('width', '100%');
						}
						$('#giraviItemForm').find('.unitPrice').siblings('.fieldSuggestionTxt').find('.fieldSuggestionUnitPrice').empty().text($(this).find('option:selected').data('sprice'));
						$('#giraviItemForm').find('.qty').siblings('.fieldSuggestionTxt').find('.fieldSuggestionQty').empty().text($(this).find('option:selected').data('qty'));
						$('#giraviItemForm').find('.qty').siblings('.fieldSuggestionTxt').find('.fieldSuggestionUnit').empty().text($(this).find('option:selected').data('mu'));
						$('#giraviItemForm').find('.qty').attr('data-parsley-max', $(this).find('option:selected').data('qty'));
						$('#giraviItemForm').find('.itmId').val($(this).val());
						$('#giraviItemForm').find('.itemFound').removeClass('hide');
					} else {
						$('#giraviItemForm').find('.itemFound').addClass('hide');
					}
				}).val(null).trigger('change');

			}
		});
	}

	function select2Itemformat(option) {
		if (!option.id) {
			return option.text;
		}
		//console.log('option::',option)
		var dataSet = option.element.dataset;
		var avtar = option.text.substring(0, 2);
		var Qty = dataSet.qty + ' ' + dataSet.mu;
		if (parseFloat(dataSet.qty) <= 0) {
			Qty = '<span style="color:red;">' + dataSet.qty + ' ' + dataSet.mu + '</span>';
		}

		var ob = '<div class="d-flex">' +
			'<div class="mg-r-10"><div class="avatar"><span class="avatar-initial rounded-circle">' + avtar + '</span></div></div>' +
			'<div class="flex-fill"><h6 class="tx-13 mg-b-2">' + option.text + '</h6><span class="d-block tx-color-03">' + dataSet.category + '</span></div>' +
			'<div class="flex-fill" style="text-align: right;"><span class="d-block txt-fnt">Available Qty : ' + Qty + '</span><span class="d-block txt-fnt">Unit Price Rs : ' + dataSet.sprice + '</span></div>' +
			'</div>';
		return ob;
	};


	function getSingleInventoryItem(id) {
		var url = '/inventory/getInventoryItems?iid=' + id;
		$.ajax({
			url: url,
			method: 'POST',
			success: function (resp) {
				//console.log('getSingleInventoryItem resp :',resp);
			}
		});
	}


	function clearGiraviItemForm() {
		//console.log('clearItemForm')
		$('#giraviItemForm').find('.searchInventoryItem').addClass('newentry');
		$('#giraviItemForm').find('input').val('');
		$('#giraviItemForm').find('select').val('');
		$('#giraviItemForm').find('select').find('option:first').prop('selected',true).trigger('change');
		$('#giraviItemForm').find('.select2-hidden-accessible').val(null).trigger('change');
		$('#giraviItemForm').find('textarea').val('');
		$('#giraviItemForm').find('.alert').remove();
		$('#giraviItemForm').find('.discountObject').empty();
		$('#giraviItemForm').find('.taxObjectArray').empty();
		$('#giraviItemForm').find('.select2-hidden-accessible').removeClass('parsley-error');
		$('#giraviItemForm').find('.parsley-error').removeClass('.parsley-error');
		$('#giraviItemForm').find('.parsley-success').removeClass('.parsley-success');
		$('#giraviItemForm').find('.select2-selection').removeClass('.parsley-error');
		$('#giraviItemForm').find('.addItemToGiraviBtn').attr('onclick', "addItemToGiravi(this,'N')");
		$('#giraviItemForm').find('.addItemToGiraviBtn').prop('disabled', true);
		$('#giraviItemForm').parsley().reset();

	}


	function calculateTotalInModal() {
		var qty = $('#giraviItemForm').find('.qty').val() == "" ? 0 : $('#giraviItemForm').find('.qty').val().split(",").join("");
		var uPrice = $('#giraviItemForm').find('.unitPrice').val() == "" ? 0 : $('#giraviItemForm').find('.unitPrice').val().split(",").join("");
		var taxPercentArry = $('#giraviItemForm').find('.taxSelect').val();
		var discountPercent = $('#giraviItemForm').find('.discountSelect').find('option:selected').data('discount') == "" || $('#giraviItemForm').find('.discountSelect').find('option:selected').data('discount') == null ? 0 : $('#giraviItemForm').find('.discountSelect').find('option:selected').data('discount');
		var discountIsPercent = $('#giraviItemForm').find('.discountSelect').find('option:selected').data('distype') == "P";


		var totAmt = (parseFloat(qty) * parseFloat(uPrice));

		var taxObjArray = [];
		var totalTaxAmount = 0;
		if (taxPercentArry.length > 0) {
			taxPercentArry.forEach(function (obj, i) {
				var txr = $('#giraviItemForm').find('option[value="' + obj + '"]').data('taxrate');
				var txName = $('#giraviItemForm').find('option[value="' + obj + '"]').text();
				var taxAmtNew = parseFloat(txr) / 100;
				totalTaxAmount = totalTaxAmount + (taxAmtNew * parseFloat(totAmt));
				taxObjArray.push({ "taxId": obj, "taxAmt": taxAmtNew * parseFloat(totAmt), "taxName": txName, "taxRate": txr });
			});
		}

		$('#giraviItemForm').find('.taxObjectArray').empty().text(JSON.stringify(taxObjArray));
		if ($('#giraviItemForm').find('.discountSelect').val() != "" && $('#giraviItemForm').find('.discountSelect').val() != null) {
			$('#giraviItemForm').find('.discountObject').empty().text(JSON.stringify({
				"id": $('#giraviItemForm').find('.discountSelect').val(),
				"discount": $('#giraviItemForm').find('.discountSelect').find('option:selected').data('discount'),
				"discode": $('#giraviItemForm').find('.discountSelect').find('option:selected').data('discode'),
				"distype": $('#giraviItemForm').find('.discountSelect').find('option:selected').data('distype')
			}));
		}



		//console.log('totalTaxAmount', totalTaxAmount);
		//console.log('taxObjArray', taxObjArray);

		var discountAmt = 0;

		if (discountIsPercent) {
			var p = parseFloat(discountPercent) / 100;
			discountAmt = p * parseFloat(totAmt);
			//console.log('discountAmt',discountAmt);
		} else {
			discountAmt = discountPercent;
		}

		var grandTotAmt = (totAmt + totalTaxAmount) - discountAmt;

		$('#giraviItemForm').find('.modalTotAmt').text(totAmt.toFixed(2));
		$('#giraviItemForm').find('.modalTotTaxAmt').text(totalTaxAmount.toFixed(2));
		$('#giraviItemForm').find('.modalDiscountAmt').text(discountAmt.toFixed(2));
		$('#giraviItemForm').find('.modalGrandTotAmt').text(grandTotAmt.toFixed(2));

	}






	function addItemToGiravi(obj, flag) {
		var itemObj = {};
		var itemId = 0;
		$('.giraviItemsTable tbody').find('.noDataTr').remove();
		var qty = $('#giraviItemForm').find('.qty').val() == "" ? 0 : $('#giraviItemForm').find('.qty').val().split(",").join("");
		var uPrice = $('#giraviItemForm').find('.unitPrice').val() == "" ? 0 : $('#giraviItemForm').find('.unitPrice').val().split(",").join("");
		var rowCount = $('.giraviItemsTable tbody tr').length;
		var totAmt = (parseFloat(qty) * parseFloat(uPrice));
		

		
		var taxPercentArry = $('#giraviItemForm').find('.taxSelect').val();
		var taxTd = "";
		var taxObjArray = [];
		if (taxPercentArry && taxPercentArry.length > 0) {
			taxPercentArry.forEach(function (objTx, i) {
				var txr = $('#giraviItemForm .taxSelect').find('option[value="' + objTx + '"]').data('taxrate');
				var txName = $('#giraviItemForm .taxSelect').find('option[value="' + objTx + '"]').text();
				var taxAmtNew = parseFloat(txr) / 100;
				taxTd = taxTd + '<span style="display:block;">' + txName + ' Rs: <b class="txamt">' + (taxAmtNew * parseFloat(totAmt)) + '</b></span>';
			});
		}

		taxTd = taxTd + '<small class="hide rowTaxTotAmt">' + $('#giraviItemForm').find('.modalTotTaxAmt').text() + '</small>';



		var discPercentArry = $('#giraviItemForm').find('.discountSelect').val();
		var discTd = "";
		var discObjArray = [];
		var rowDiscTotAmt = 0;
		if (discPercentArry && discPercentArry.length > 0) {
			discPercentArry.forEach(function (objDisc, i) {
				var discr = $('#giraviItemForm .discountSelect').find('option[value="' + objTx + '"]').data('discountrate');
				var discAmtNew = parseFloat(discr) / 100;
				discTd = discTd + '<span> '+discr+'% Rs: <b class="discamt">' + (discAmtNew * parseFloat(totAmt)) + '</b></span>';
				rowDiscTotAmt = rowDiscTotAmt + (discAmtNew * parseFloat(totAmt));
			});
		}

		discTd = discTd + '<small class="hide rowDiscTotAmt">' + rowDiscTotAmt + '</small>';

		

		itemObj.id = $('#giraviItemForm').find('.itmId').val();
		itemObj.invItemid = $('#giraviItemForm').find('.itmId').val();
		itemObj.categoryid = null;//$('#giraviItemForm').find('.searchInventoryItem').find('option:selected').data('category-id');
		itemObj.name = $('#giraviItemForm').find('.searchInventoryItem').find('option:selected').text();
		itemObj.hsn = $('#giraviItemForm').find('.itmHSN').text();
		itemObj.qty = $('#giraviItemForm').find('.qty').val()
		itemObj.mu = $('#giraviItemForm').find('.searchInventoryItem').find('option:selected').data('mu');
		itemObj.uPrice = $('#giraviItemForm').find('.unitPrice').val();
		itemObj.qtyAmt = $('#giraviItemForm').find('.modalTotAmt').text();
		itemObj.discAmt = $('#giraviItemForm').find('.modalDiscountAmt').text();
		itemObj.taxableAmt = $('#giraviItemForm').find('.modalTotAmt').text();
		itemObj.totAmt = $('#giraviItemForm').find('.modalGrandTotAmt').text();
		itemObj.taxArr = $('#giraviItemForm').find('.taxObjectArray').text();
		itemObj.discArr = $('#giraviItemForm').find('.discountObject').text();

		
		var tr = ' <tr>' +
			' <td class="trCount">' + (rowCount + 1) + '</td>' +
			' <td class="itemNameTd">' + $('#giraviItemForm').find('.searchInventoryItem').find('option:selected').text() + '</td>' +
			' <td class="itemHSNTd col-hsn">' + $('#giraviItemForm').find('.itmHSN').text() + '</td>' +
			' <td class="itemQtyTd"><span>' + $('#giraviItemForm').find('.qty').val() + '</span> ' + $('#giraviItemForm').find('.searchInventoryItem').find('option:selected').data('mu') + '</td>' +
			' <td class="itemUPTd col-up">Rs: <span>' + $('#giraviItemForm').find('.unitPrice').val() + '</span></td>' +
			' <td class="itemTATd">Rs: <span>' + $('#giraviItemForm').find('.modalTotAmt').text() + '</span></td>' +
			' <td class="itemDisTd col-disc">' + discTd + '</td>' +
			' <td class="itemTaxAmtTd">Rs: <span class="txamt">' + $('#giraviItemForm').find('.modalTotAmt').text() + '</span></td>' +
			' <td class="itemTaxTd col-tax">' + taxTd + '</td>' +
			' <td class="">' +
			'<span class="itemGrandAmt hide">' + $('#giraviItemForm').find('.modalGrandTotAmt').text() + '</span>' +
			'<span class="itemId hide">' + $('#giraviItemForm').find('.itmId').val() + '</span>' +
			'<span class="rowTaxObjArray hide">' + $('#giraviItemForm').find('.taxObjectArray').text() + '</span>' +
			'<span class="rowDiscountObj hide">' + $('#giraviItemForm').find('.discountObject').text() + '</span>' +
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

		console.log('adding tr')

		if (flag == 'N') {
			$('.giraviItemsTable tbody').append(tr);
		} else if (flag == 'M') {
			var rowindex = $(obj).data('rowindex');
			var oldTr = $('.giraviItemsTable tbody tr:eq(' + rowindex + ')');
			oldTr.replaceWith(tr);

			/* $('.giraviItemsTable tbody tr:eq('+rowindex+')').remove();
			if(rowindex==0){
				$('.giraviItemsTable tbody').prepend(tr);
			}else{
				$(tr).insertAfter($('.giraviItemsTable tbody tr:eq('+(rowindex)+')'));
			} */
			updateTableSerialNumber();
		}

		updateTfootTotal();
		//addTfootTotal()
		feather.replace();
		$('#modalAddGiraviItem').modal('toggle');

	}


	function updateGiraviItm(obj) {
		clearGiraviItemForm();
		var trObj = $(obj).closest('tr');
		$('#giraviItemForm').find('.searchInventoryItem').removeClass('newentry');
		$('#giraviItemForm').find('.searchInventoryItem').val($(trObj).find('.itemId').text()).trigger('change');
		$('#giraviItemForm').find('.qty').val($(trObj).find('.itemQtyTd span').text()).trigger('keyup');
		$('#giraviItemForm').find('.unitPrice').val($(trObj).find('.itemUPTd span').text()).trigger('keyup');
		var taxVal = [];
		if ($.isArray(JSON.parse($(trObj).find('.rowTaxObjArray').text()))) {
			JSON.parse($(trObj).find('.rowTaxObjArray').text()).forEach(function (tax) {
				taxVal.push(tax.taxId);
			});
		}
		$('#giraviItemForm').find('.taxSelect').val(taxVal).trigger('change');
		if ($(trObj).find('.rowDiscountObj').text() != "") {
			var discObj = JSON.parse($(trObj).find('.rowDiscountObj').text());
			$('#giraviItemForm').find('.discountSelect').val(discObj.id).trigger('change');
		} else {
			$('#giraviItemForm').find('.discountSelect').val(null).trigger('change');
		}
		$('#giraviItemForm').find('.addItemToGiraviBtn').attr('onclick', "addItemToGiravi(this,'M')");
		$('#giraviItemForm').find('.addItemToGiraviBtn').data('rowindex', $(trObj).index());
		$('#modalAddGiraviItem').modal('toggle');
	}
</script>