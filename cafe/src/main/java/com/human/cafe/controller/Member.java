package com.human.cafe.controller;

import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import com.human.cafe.vo.*;
import com.human.cafe.dao.MemberDao;
import com.human.cafe.util.*;

@Controller
@RequestMapping("/member")
public class Member {
	
	@Autowired
	ColorList color;
	@Autowired
	MemberDao mDao;
	/**
	 * 로그인 화면 보기 요청 전담 처리함수
	 */
	@RequestMapping("/login.cafe")
	public ModelAndView login(HttpSession session, ModelAndView mv, RedirectView rv) {
		String view = "member/login";
		mv.setViewName(view);
		return mv;
	}
	/**
	 * 로그인 요청 전담 처리함수
	 */
	
	@RequestMapping("/loginProc.cafe")
	public ModelAndView loginProc(HttpSession session, ModelAndView mv, RedirectView rv, MemberVO mVO) {
		String view = "";
		int cnt = mDao.getLogin(mVO);
		mVO.setCnt(cnt);
		if(cnt != 1) {
			view = "member/login";
			mv.setViewName(view);
		}else {
			rv.setUrl("/cafe/main.cafe");
			mv.setView(rv);
			session.setAttribute("SID", mVO.getId());
		}
		return mv;
	}
	
	/**
	 * 로그아웃 요청 전담 처리 함수
	 */
	@RequestMapping("/logoutProc.cafe")
	public ModelAndView logoutProc(HttpSession session, ModelAndView mv, RedirectView rv) {
		session.removeAttribute("SID");
		String view = "/cafe/main.cafe";
		rv.setUrl(view);
		mv.setView(rv);
		return mv;
	}
	
	/**
	 * 회원가입 폼보기 요청 전담 처리 함수
	 */
	@RequestMapping("/join.cafe")
	public ModelAndView join(HttpSession session, ModelAndView mv, RedirectView rv) {
		mv.setViewName("member/join"); // 포워드
		return mv;
	}
	
	/**
	 * 아이디 체크 요청 전담 처리함수
	 */
	@RequestMapping("/idCheck.cafe")
	@ResponseBody
	public HashMap idCheck(String id) {
		HashMap map = new HashMap();
		// 데이터베이스 조회
		int cnt = mDao.idCheck(id);
		String result = "NO";
		if(cnt == 0) {
			result ="YES";
		}
		map.put("result", result);
		return map;
	}
	
	/**
	 * 회원가입 처리 요청 전담 처리함수
	 */
	@RequestMapping("/joinProc.cafe")
	public ModelAndView joinProc(HttpSession session, ModelAndView mv, RedirectView rv, MemberVO mVO) {
		// 데이터베이스 작업
		int cnt = mDao.addMemb(mVO);
		mVO.setCnt(cnt);
		// 뷰 셋팅하고
		String sid = mVO.getId();
		if(cnt == 1) {
			session.setAttribute("SID", sid);
			rv.setUrl("/cafe/main.cafe");
		} else {
			// 회원가입에 실패한 경우
			rv.setUrl("/cafe/member/join.cafe");
		}
		mv.setView(rv);
		return mv;
	}
}













