/*====================
   MemberMain.java
   - 컨트롤러
====================*/

package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberMain
{
	// mybatis 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	// /memberList.action 으로 요청이 들어오면 아래의 메소드가 일을 처리
	@RequestMapping(value = "/memberlist.action", method = RequestMethod.GET)
	public String memberList(ModelMap model)	// Model, ModelMap 둘 다 사용 가능
	{
		// 기존의 방식
		// IMemberDAO dao = MemberDAO 객체 생성
		// 이걸 이제는 마이바티스가 수행해줌(아래 코드)
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
	      
	    model.addAttribute("count", dao.count());
	    model.addAttribute("list", dao.list());
	      
	    return "/WEB-INF/views/MemberList.jsp";
	}
}
