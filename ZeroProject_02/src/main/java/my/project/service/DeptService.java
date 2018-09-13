package my.project.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import my.project.model.DeptDao;
import my.project.model.deptDto;

@Service
public class DeptService {
	
	@Autowired
	private SqlSession sqlsession; 
	@Autowired
	private View jsonview;
	
	public List<deptDto> getlist(deptDto d) throws SQLException {
		DeptDao deptDao = sqlsession.getMapper(DeptDao.class);
		List<deptDto> deptlist = deptDao.getDeptList(d);;

	
		return deptlist;
}
	
	public String insert(deptDto deptdto) {
		DeptDao deptdao = sqlsession.getMapper(DeptDao.class);
		deptdao.insertDept(deptdto);
		System.out.println("Service => deptno : "+deptdto.getDeptno());
		return "redirect:deptList.htm";
	}
	
	public String deptupdate(deptDto dto) throws ClassNotFoundException, SQLException {
		DeptDao deptdao = sqlsession.getMapper(DeptDao.class);
		deptdao.update(dto);
		return "redirect:deptList.htm"; 
	}
	
	   public String deptdelete(int deptno) {
		DeptDao deptdao = sqlsession.getMapper(DeptDao.class);
		deptdao.delete(deptno);
	    return "redirect:deptList.htm";
	      
	   }
	
	public List<deptDto> checkDeptno(int deptno) {
		System.out.println("service : " + deptno);
		DeptDao deptdao = sqlsession.getMapper(DeptDao.class);
		List<deptDto> list = deptdao.check(deptno);
		return list;
	}
}
