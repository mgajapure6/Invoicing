package com.mgsoft.invoicing.module.admin;

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

import com.mgsoft.invoicing.beans.Customer;
import com.mgsoft.invoicing.beans.Module;
import com.mgsoft.invoicing.repositories.CustomerRepository;
import com.mgsoft.invoicing.repositories.ModuleRepository;

@Controller
@RequestMapping(value="/admin/moduleSetting")
public class ModuleSettingController {
	///admin/moduleSetting
	
	@Autowired
	private ModuleRepository moduleRepository;
	
	@RequestMapping(value= "")
	public ModelAndView showModuleSetting(HttpServletRequest request, HttpServletResponse response) {
		
		/*ModelAndView modelAndView =  new ModelAndView();
		if(request.getSession().getAttribute("user")==null) {
			modelAndView.setViewName("redirect:/login");
			return modelAndView;
		}else {
			modelAndView.setViewName("dashboard/SalesDashboard");
			return modelAndView;
		}*/
		request.setAttribute("allModules", moduleRepository.findAll());
		ModelAndView modelAndView =  new ModelAndView();
		modelAndView.setViewName("admin/moduleSetting");
		return modelAndView;
	}
	
	
	@PostMapping(value = "/saveUpdateDeleteModule")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteModule(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long id = Long.parseLong(request.getParameter("moduleId"));
		String moduleName = request.getParameter("moduleName");
		String moduleNameOl = request.getParameter("moduleNameOl");
		String status = request.getParameter("status");
		String flag = request.getParameter("flag");
		Module module = new Module();
		module.setId(id);
		module.setModuleName(moduleName);
		module.setModuleNameOl(moduleNameOl);
		module.setHasLink(false);
		module.setStatus(status);
		

		if (flag.equals("D")) {
			moduleRepository.delete(module);
			res.put("status", "success");
			res.put("msg", "Successfully deleted customer entry !");
		} else {
			Module moRes = moduleRepository.save(module);
			System.out.println("Module res :" + moRes);
			if (moRes != null) {
				if (flag.equals("N")) {
					res.put("status", "success");
					res.put("msg", "Successfully save module entry !");
				} else {
					res.put("status", "success");
					res.put("msg", "Successfully updated module entry !");
				}
			} else {
				if (flag.equals("N")) {
					res.put("status", "failed");
					res.put("msg", "Failed to save module entry !");
				} else {
					res.put("status", "failed");
					res.put("msg", "Failed to update module entry !");
				}
			}
		}
		return res;
	}

}
