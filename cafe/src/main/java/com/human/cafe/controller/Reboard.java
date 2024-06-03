package com.human.cafe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.RedirectView;

import com.human.cafe.util.PageUtil;
import com.human.cafe.vo.ReboardVO;
/**
 * 이 클래스는 댓글 게시판 관련 요청을 처리해주는 컨트롤러 클래스
 * @author  김광섭
 * @since	2024/06/03
 * @version v.1.0
 * 			작업이력 ]
 * 				2024/06/03 - 담당자 : 김광섭
 * 								리스트 폼보기 요청
 * 								글쓰기 폼보기 요청 
 *
 */
@Controller
@RequestMapping("/reboard")
public class Reboard {
	@RequestMapping("/reboard.cafe")
	public ModelAndView reboardList(HttpSession session, ModelAndView mv, RedirectView rv, PageUtil page) {
		mv.setViewName("reboard/reboard"); 
		return mv;
	}
	
	@RequestMapping("/reboardWrite.cafe")
	public ModelAndView reboardWrite(HttpSession session, ModelAndView mv, RedirectView rv, String nowPage, ReboardVO rVO) {
		mv.addObject("NOWPAGE", nowPage);
		mv.addObject("DATA", rVO);
		mv.setViewName("reboard/reboardWrite");
		return mv;
	}
}
