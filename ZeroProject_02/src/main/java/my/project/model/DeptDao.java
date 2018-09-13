package my.project.model;

import java.util.ArrayList;

public interface DeptDao {
	

	
ArrayList<deptDto> getDeptList(deptDto d);
	
int insertDept(deptDto d);
	
int update(deptDto d);
	
int delete(int deptno);

ArrayList<deptDto> check(int deptno);

/*int check(int deptno);*/
}
