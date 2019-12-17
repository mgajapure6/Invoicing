package com.mgsoft.invoicing.module.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/admin")
public class UserSettingController {
	///admin/menuSetting
	
	@RequestMapping(value= "/userSetting")
	public ModelAndView showMenuSetting(HttpServletRequest request, HttpServletResponse response) {
		
		/*ModelAndView modelAndView =  new ModelAndView();
		if(request.getSession().getAttribute("user")==null) {
			modelAndView.setViewName("redirect:/login");
			return modelAndView;
		}else {
			modelAndView.setViewName("dashboard/SalesDashboard");
			return modelAndView;
		}*/
		
		ModelAndView modelAndView =  new ModelAndView();
		modelAndView.setViewName("admin/userSetting");
		return modelAndView;
	}

}
