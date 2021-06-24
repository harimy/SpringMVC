/*=====================================================================================
   #49. DepartmentUpdateController.java
        (departmentupdate.action)
   - 사용자 정의 컨트롤러 클래스
   - 부서 데이터 입력 액션 수행 후 departmentlist.action 다시 요청할 수 있도록 안내
   - DAO 객체에 대한 의존성 주입(DI)을 위한 준비
     → 인터페이스 형태의 자료형을 속성으로 구성
     → setter 메소드 구성
=====================================================================================*/
package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 `Controller` 인터페이스를 구현하는 방법을 통해
//   사용자 정의 컨트롤러 클래스를 구현한다.

public class DepartmentUpdateController implements Controller
{
	private IDepartmentDAO dao;
	
	public void setDao(IDepartmentDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리과정 추가 ----------------------------------------------------------------
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name")==null)
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if (session.getAttribute("admin")==null)
		{
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		
		// ---------------------------------------------------------------- 세션 처리과정 추가
		
		try
		{
			String departmentId = request.getParameter("departmentId");
			String departmentName = request.getParameter("departmentName");
			
			Department department = new Department();
			
			department.setDepartmentId(departmentId);
			department.setDepartmentName(departmentName);
			
			dao.modify(department);
			
			mav.setViewName("redirect:departmentlist.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
		
	}
	
}
