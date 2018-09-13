package my.project.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import my.project.model.deptDto;
import my.project.service.DeptService;

@Controller

public class DeptController {
	

	@Autowired
	private View jsonview;
	
	@Autowired
	private DeptService service; 

	
	@RequestMapping("deptList.htm")
	public String getlist(deptDto d, Model model) throws SQLException {

		List<deptDto> deptlist = service.getlist(d);
		model.addAttribute("list", deptlist);
	
		return "dept.deptList";
}
	
	@RequestMapping(value="deptInsert.htm", method=RequestMethod.POST)
	public @ResponseBody View insert(@RequestBody deptDto dto) {
		service.insert(dto);

		return jsonview;
	}
	
	@RequestMapping(value="deptUpdate.htm", method=RequestMethod.POST)
	public String deptupdate(deptDto dto) throws ClassNotFoundException, SQLException {

		return service.deptupdate(dto); 
	}
	
	@RequestMapping(value="deptDelete.htm", method=RequestMethod.GET)
	public String deptdelete(int deptno) {

	    return service.deptdelete(deptno);
	      
	}
	
	@RequestMapping("checkDeptno.htm")
	public View chechDeptno(int deptno, ModelMap map) {
		List<deptDto> list = service.checkDeptno(deptno);
		map.addAttribute("list", list);
		return jsonview;
	}
	

	
}
