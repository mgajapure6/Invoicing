package com.mgsoft.invoicing.module.giravi.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mgsoft.invoicing.beans.Customer;
import com.mgsoft.invoicing.module.giravi.beans.GiraviItem;
import com.mgsoft.invoicing.module.giravi.beans.Loan;
import com.mgsoft.invoicing.module.giravi.beans.PartyAccount;
import com.mgsoft.invoicing.module.giravi.repository.GiraviMasterRepository;
import com.mgsoft.invoicing.module.giravi.repository.PartyAccountRepository;
import com.mgsoft.invoicing.repositories.CustomerRepository;
import com.mgsoft.invoicing.util.JsonUtil;

@Controller
@RequestMapping("/app/giravi/giraviMaster")
public class GiraviMasterController {

	@Autowired
	public GiraviMasterRepository giraviMasterRepository;

	@Autowired
	public PartyAccountRepository partyAccountRepository;
	
	@Autowired
	private CustomerRepository customerRepository;

	@GetMapping("")
	public String showPage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("partyAccount", new PartyAccount());
		List<PartyAccount> list = partyAccountRepository.findAll();
		request.setAttribute("customers", customerRepository.findAll());
		request.setAttribute("partyAccountList", list.size()>0 ? JsonUtil.javaCollectionToJson(list) : new ArrayList<>());
		return "giravi/giraviMaster";
	}

	@PostMapping("/saveGiravi")
	@ResponseBody
	public Map<String, Object> save(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		String giraviId = request.getParameter("giraviId");
		String flag = request.getParameter("flag");
		String customerId = request.getParameter("customerId");
		String giraviNo = request.getParameter("giraviNo");
		String giraviDate = request.getParameter("giraviDate");
		String posoNo = request.getParameter("posoNo");
		String payDueDate = request.getParameter("payDueDate");
		String giraviAmt = request.getParameter("giraviAmt");
		String grndTotAmt = request.getParameter("grndTotAmt");
		String recipientDesc = request.getParameter("recipientDesc");
		Float intrestRate = Float.valueOf(request.getParameter("intrestRate"));
		Float loanAmount = Float.valueOf(request.getParameter("loanAmount"));
		JsonParser parser = new JsonParser();
		JsonElement jsonElement = parser.parse(request.getParameter("items"));
		JsonArray itemsArr = jsonElement.getAsJsonArray();
		
		
		Customer cus = customerRepository.getOne(Long.valueOf(customerId));
		
		Loan loan = new Loan();
		loan.setId(Integer.valueOf(giraviId));
		loan.setIntrestRate(intrestRate);
		loan.setLoanAmount(loanAmount);
		//loan.setLoanTransactions(null);
		loan.setCustomer(cus);
		
		List<GiraviItem> itemsList = new ArrayList<>();
		
		if(itemsArr.size()>0) {
			Iterator<JsonElement> itr = itemsArr.iterator();
			while (itr.hasNext()) {
				JsonObject jo = itr.next().getAsJsonObject();
				System.out.println("jo::"+jo);
				GiraviItem gi = new GiraviItem();
				gi.setId(jo.get("id").getAsInt());
				gi.setItmName(jo.get("name").getAsString());
				gi.setItmMetalType(jo.get("metalType").getAsString());
				gi.setItmDesc(jo.has("desc") && !jo.get("desc").isJsonNull() ? jo.get("desc").getAsString() : null);
				gi.setItmEligibleAmount(jo.get("payableAmt").getAsFloat());
				gi.setItmGrossWeight(jo.get("grossWeight").getAsFloat());
				gi.setItmGrossWeightUom(jo.get("grossWeightUom").getAsString());
				gi.setItmNetWeight(jo.get("netWeight").getAsFloat());
				gi.setItmNetWeightUom(jo.get("netWeightUom").getAsString());
				gi.setItmQty(jo.get("qty").getAsFloat());
				gi.setItmValuation(jo.get("valuationAmt").getAsFloat());
				gi.setLoan(loan);
				itemsList.add(gi);
			}
		}
		
		loan.setGiraviItems(itemsList);
		
		Customer customer = customerRepository.save(cus);
		if (customer != null) {
			res.put("status", "success");
			res.put("msg", "Successfully save module entry !");
		} else {
			res.put("status", "failed");
			res.put("msg", "Failed to save module entry !");
		}
		
		System.out.println("itemsArr::"+itemsArr);

		return res;
	}
}
