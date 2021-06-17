/*================================
   MemberInsertController.java
   - 사용자 정의 컨트롤러 클래스
   - 회원 데이터 추가 액션 처리 클래스.
   - DAO 객체에 대한 의존성 주입 준비.
================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 `Controller` 인터페이스를 구현하는 방법을 통해
//   사용자 정의 컨트롤러 클래스를 구현한다.

public class MemberInsertController implements Controller
{
	// 인터페이스 자료형을 취하는 속성 구성
	private IMemberDAO dao;
	
	// setter 구성
	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		request.setCharacterEncoding("UTF-8");
		
		// 이전 페이지로부터 넘어온 데이터 수신
		String name = request.getParameter("name");
		String tel = request.getParameter("telephone");
		
		try
		{
			
			MemberDTO member = new MemberDTO();
			member.setName(name);
			member.setTelephone(tel);
			
			dao.add(member);
			
		} catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		//mav.setViewName("Memberlist.action 페이지를 다시 요청할 수 있도록 안내(redirect)");
		mav.setViewName("redirect:memberlist.action");
		
		//mav.setViewName("/WEB-INF/views/MemberList.jsp"); --(Ｘ)
		
		return mav;
		
	}
	
}
