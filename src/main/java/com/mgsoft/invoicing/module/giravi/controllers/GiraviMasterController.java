package com.mgsoft.invoicing.module.giravi.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mgsoft.invoicing.module.giravi.beans.PartyAccount;
import com.mgsoft.invoicing.module.giravi.repository.GiraviMasterRepository;
import com.mgsoft.invoicing.module.giravi.repository.PartyAccountRepository;
import com.mgsoft.invoicing.util.JsonUtil;

@Controller
@RequestMapping("/app/giravi")
public class GiraviMasterController {

	@Autowired
	public GiraviMasterRepository giraviMasterRepository;

	@Autowired
	public PartyAccountRepository partyAccountRepository;

	@PostMapping("/giraviMaster")
	public String showPage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("partyAccount", new PartyAccount());
		request.setAttribute("partyAccountList", JsonUtil.javaCollectionToJson(partyAccountRepository.findAll()));
		return "giravi/giraviMaster";
	}

	@PostMapping("/giraviMaster/save")
	@ResponseBody
	public String save(HttpServletRequest request, HttpServletResponse response) {
		String jsonObj = request.getParameter("jsonData");
		JsonParser parser = new JsonParser();
		JsonElement jsonElement = parser.parse(jsonObj);
		JsonObject jsonObject = jsonElement.getAsJsonObject();
		JsonObject headObject = jsonObject.get("head").getAsJsonObject();
		JsonArray lineArr = jsonObject.get("line").getAsJsonArray();

		return "giravi/giraviMaster";
	}
}
