package com.mgsoft.invoicing.module.setting.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mgsoft.invoicing.module.setting.beans.Discount;
import com.mgsoft.invoicing.module.setting.repositories.DiscountRepository;

@Controller
@RequestMapping(value = "/app/setting/discount")
public class DiscountController {

    @Autowired
    private DiscountRepository discountRepository;

    @RequestMapping(value = "/saveUpdateDeleteDiscount")
    @ResponseBody
    public Map<String, Object> saveUpdateDeleteDiscount(HttpServletRequest request, HttpServletResponse response) {
	Map<String, Object> res = new HashMap<>();
	Long id = Long.parseLong(request.getParameter("discountId"));
	String discType = request.getParameter("discType");
	String discount = request.getParameter("discountRate");
	String disCode = request.getParameter("disCode");
	String status = request.getParameter("statusSelect");

	String flag = request.getParameter("flag");
	Discount dis = new Discount();
	dis.setId(id);
	dis.setDiscType(discType);
	dis.setDiscountRateInPercent(discount);
	dis.setDisCode(disCode);
	dis.setStatus(status);

	if (flag.equals("D")) {
	    discountRepository.delete(dis);
	    res.put("status", "success");
	    res.put("msg", "Successfully deleted discount entry !");
	} else {
	    Discount disRes = discountRepository.save(dis);
	    System.out.println("Discount res :" + disRes);
	    if (disRes != null) {
		if (flag.equals("N")) {
		    res.put("status", "success");
		    res.put("msg", "Successfully save discount entry !");
		} else {
		    res.put("status", "success");
		    res.put("msg", "Successfully updated discount entry !");
		}
	    } else {
		if (flag.equals("N")) {
		    res.put("status", "failed");
		    res.put("msg", "Failed to save discount entry !");
		} else {
		    res.put("status", "failed");
		    res.put("msg", "Failed to update discount entry !");
		}
	    }
	}
	return res;
    }

}
