/*=============================
   MemberDTO.java
   - 데이터 저장 및 전송 전용 객체
=============================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IMemberDAO
{
	public int add(MemberDTO m);
	public int count();
	public ArrayList<MemberDTO> list();
	public int remove(MemberDTO m);
	
}
