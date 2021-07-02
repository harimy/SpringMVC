/*=====================
 * Sample.java
 * - 컨트롤러 객체
======================*/

package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StudentController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/studentlist.action", method=RequestMethod.GET)
	public String studentList(Model model)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		return "/WEB-INF/views/StudentList.jsp";
	}
	
	@RequestMapping(value="/studentinsertform.action")
	public String studentInsertForm()
	{
		return "/WEB-INF/views/StudentInsertForm.jsp";
	}
	
	
	@RequestMapping(value="/studentinsert.action", method=RequestMethod.POST)
	public String studentInsert(StudentDTO s)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		dao.add(s);
		
		return "redirect:studentlist.action";
	}
	
	@RequestMapping(value="/gradelist.action")
	public String gradeList(Model model)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		return "/WEB-INF/views/GradeList.jsp";
	}

}
