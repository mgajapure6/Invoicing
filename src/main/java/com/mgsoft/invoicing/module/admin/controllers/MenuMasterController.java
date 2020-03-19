package com.mgsoft.invoicing.module.admin.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.invoicing.module.admin.beans.Menu;
import com.mgsoft.invoicing.module.admin.beans.Module;
import com.mgsoft.invoicing.module.admin.repository.MenuRepository;
import com.mgsoft.invoicing.module.admin.repository.ModuleRepository;

@Controller
@RequestMapping(value="/app/admin/menuMaster")
public class MenuMasterController {
	///admin/menuSetting
	
	@Autowired
	private MenuRepository menuRepository;
	
	@Autowired
	private ModuleRepository moduleRepository; 
	
	@RequestMapping(value= "")
	public ModelAndView showMenuSetting(HttpServletRequest request, HttpServletResponse response) {
		
		/*ModelAndView modelAndView =  new ModelAndView();
		if(request.getSession().getAttribute("user")==null) {
			modelAndView.setViewName("redirect:/login");
			return modelAndView;
		}else {
			modelAndView.setViewName("dashboard/SalesDashboard");
			return modelAndView;
		}*/
		request.setAttribute("allMenus", menuRepository.findAll());
		request.setAttribute("moduleList", moduleRepository.findAll());
		ModelAndView modelAndView =  new ModelAndView();
		modelAndView.setViewName("admin/menuSetting");
		return modelAndView;
	}

	@PostMapping(value = "/saveUpdateDeleteMenu")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteModule(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long id = Long.parseLong(request.getParameter("menuId"));
		String menuName = request.getParameter("menuName");
		String menuNameOl = request.getParameter("menuNameOl");
		Long moduleId = Long.parseLong(request.getParameter("moduleId"));
		String moduleName = request.getParameter("moduleName");
		String status = request.getParameter("status");
		String flag = request.getParameter("flag");
		String pageUrl = request.getParameter("pageUrl");
		
		Module module = moduleRepository.getOne(moduleId);
		
		Menu menu = new Menu();
		menu.setId(id);
		menu.setMenuName(menuName);
		menu.setMenuNameOl(menuNameOl);
		menu.setParentId(moduleId);
		menu.setParentName(moduleName);
		menu.setHasLink(false);
		menu.setStatus(status);
		menu.setModule(module);
		menu.setLink(pageUrl);
		module.getMenus().add(menu);
		
		
		if (flag.equals("D")) {
			menuRepository.delete(menu);
			res.put("status", "success");
			res.put("msg", "Successfully deleted customer entry !");
		} else {

			Module moRes = moduleRepository.save(module);
			System.out.println("Module res :" + moRes);
			if (moRes != null) {
				if (flag.equals("N")) {
					res.put("status", "success");
					res.put("msg", "Successfully save menu entry !");
				} else {
					res.put("status", "success");
					res.put("msg", "Successfully updated menu entry !");
				}
			} else {
				if (flag.equals("N")) {
					res.put("status", "failed");
					res.put("msg", "Failed to save menu entry !");
				} else {
					res.put("status", "failed");
					res.put("msg", "Failed to update menu entry !");
				}
			}
		}
		return res;
	}
}
