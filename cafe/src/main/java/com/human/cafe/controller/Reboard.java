package com.human.cafe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.RedirectView;

import com.human.cafe.dao.ReboardDao;
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
 * 				2024/06/04 - 담당자 : 김광섭
 *								리스트 폼보기 요청 페이지 객체 추가 수정
 *								글 등록 요청 처리
 */
@Controller
@RequestMapping("/reboard")
public class Reboard {
	@Autowired
	ReboardDao rDao;
	
	@RequestMapping("/reboard.cafe")
	public ModelAndView reboardList(HttpSession session, ModelAndView mv, RedirectView rv, PageUtil page) {
		int total = rDao.getTotal();
		page.setTotalCount(total);
		page.setPage();
		List list = rDao.getList(page);
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		mv.setViewName("reboard/reboard"); 
		return mv;
	}
	
	@RequestMapping("/reboardWrite.cafe")
	public ModelAndView reboardWrite(HttpSession session, ModelAndView mv, RedirectView rv, String nowPage, ReboardVO rVO) {
		mv.addObject("DATA", rVO);
		mv.setViewName("reboard/reboardWrite");
		return mv;
	}
	@RequestMapping("/reboardRewrite.cafe")
	public ModelAndView reboardRewrite(HttpSession session, ModelAndView mv, RedirectView rv, String nowPage, ReboardVO rVO, PageUtil page) {
		rVO = rDao.getUpContent(rVO.getBno());
		rVO.setNowPage(page.getNowPage());
		mv.addObject("DATA", rVO);
		mv.setViewName("reboard/reboardWrite");
		return mv;
	}
	
	@RequestMapping("/reboardWriteProc.cafe")
	public ModelAndView reboardWriteProc(HttpSession session, ModelAndView mv, RedirectView rv, ReboardVO rVO) {
		// 로그인처리는 인터셉터
		int cnt = rDao.addBoard(rVO);
		String path = "";
		if(cnt == 1) {
			path = "/cafe/reboard/reboard.cafe";
		}else {
			if(rVO.getLevel() == 0) {
				path = "/cafe/reboard/reboardWrite.cafe";
			}else {
				path = "/cafe/reboard/reboardRewrite.cafe";
				mv.addObject("BNO", rVO.getBno());
			}
		}
		mv.addObject("nowPage", rVO.getNowPage());
		mv.addObject("PATH", path);
		mv.setViewName("redirect");
		return mv;
	}
	
	@RequestMapping("/delReboard.cafe")
	public ModelAndView delReboard(HttpSession session, ModelAndView mv, RedirectView rv, ReboardVO rVO) {
		int cnt = rDao.delReboard(rVO);
		String path = "/cafe/reboard/reboard.cafe";
		mv.addObject("PATH", path);
		mv.addObject("nowPage", rVO.getNowPage());
		mv.setViewName("redirect");
		return mv;
	}
	@RequestMapping("/addGood.cafe")
	public ModelAndView addGood(HttpSession session, ModelAndView mv, RedirectView rv, ReboardVO rVO) {
		rDao.addGood(rVO.getBno());
		mv.addObject("PATH", "/cafe/reboard/reboard.cafe");
		mv.addObject("nowPage", rVO.getNowPage());
		mv.setViewName("redirect");
		return mv;
	}
	
}
