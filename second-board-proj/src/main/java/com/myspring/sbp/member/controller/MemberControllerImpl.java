package com.myspring.sbp.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.sbp.member.service.MemberService;
import com.myspring.sbp.member.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl implements MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;

	@Override
	@RequestMapping(value = "/member/listMembers.do", method = RequestMethod.GET)
	public String listMembers(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");

		String viewName = (String) request.getAttribute("viewName");
		List membersList = memberService.listMembers();

		model.addAttribute("membersList", membersList);

		String result = request.getParameter("result");
		if (result == null) {
			return viewName;
		} else if (result.equals("updated")) {
			model.addAttribute("result", "updated");
		} else if (result.equals("deleted")) {
			model.addAttribute("result", "deleted");
		}

		return viewName;
	}

	@Override
	@RequestMapping(value = "/member/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");

		int result = 0;
		result = memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/home.do");
		mav.addObject("result", "added");
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/updateMember.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");

		int result = 0;
		result = memberService.updateMember(member);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		mav.addObject("result", "updated");
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/updateMypage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateMypage(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");

		int result = 0;
		result = memberService.updateMember(member);

		// 세션에 저장되어 있는 회원 정보 수정
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.setAttribute("member", member);

		ModelAndView mav = new ModelAndView("redirect:/member/mypage.do");
		mav.addObject("result", "updated");
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/mypage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String mypage(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");

		String viewName = (String) request.getAttribute("viewName");
		String result = request.getParameter("result");
		if (result == null) {
			return viewName;
		} else if (result.equals("updated")) {
			model.addAttribute("result", "updated");
		}
		return viewName;
	}

	@Override
	@RequestMapping(value = "/member/removeMember.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		memberService.removeMember(id);

		HttpSession session = request.getSession();
		String sid = ((MemberVO) session.getAttribute("member")).getId();

		if (sid.equals("admin")) {
			ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
			mav.addObject("result", "deleted");
			return mav;
		} else {
			session.removeAttribute("member");
			session.removeAttribute("isLogOn");
			ModelAndView mav = new ModelAndView("redirect:/home.do");
			mav.addObject("result", "deleted");
			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();

		if (member.getId().equals("admin") && member.getPwd().equals("1234")) {
			memberVO = member;
		} else {
			memberVO = memberService.login(member);
		}

		if (memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);

			String action = (String) session.getAttribute("action");
			session.removeAttribute("action");

			if (action != null) { // 로그인에 성공하면 원래 시도하려고 했던 페이지로 감
				mav.setViewName("redirect:" + action);
			} else {
				mav.setViewName("redirect:/home.do");
			}

		} else {

			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}

		return mav;
	}

	@Override
	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		model.addAttribute("result", "logouted");
		return "redirect:/home.do";
	}

	@Override
	@RequestMapping(value = "/member/*Form.do", method = RequestMethod.GET)
	public String form(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");

		String id = (String) request.getParameter("id");

		// 폼 작성 이후에 하려는 액션이 있으면 바인딩
		HttpSession session = request.getSession();
		session.setAttribute("action", action);

		model.addAttribute("result", result);
		model.addAttribute("id", id);
		return viewName;
	}

//	private String getViewName(HttpServletRequest request) throws Exception {
//		String contextPath = request.getContextPath();
//		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
//		if (uri == null || uri.trim().equals("")) {
//			uri = request.getRequestURI();
//		}
//
//		int begin = 0;
//		if (!((contextPath == null) || ("".equals(contextPath)))) {
//			begin = contextPath.length();
//		}
//
//		int end;
//		if (uri.indexOf(";") != -1) {
//			end = uri.indexOf(";");
//		} else if (uri.indexOf("?") != -1) {
//			end = uri.indexOf("?");
//		} else {
//			end = uri.length();
//		}
//
//		String viewName = uri.substring(begin, end);
//		if (viewName.indexOf(".") != -1) {
//			viewName = viewName.substring(0, viewName.lastIndexOf("."));
//		}
//		if (viewName.lastIndexOf("/") != -1) {
//			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
//		}
//		return viewName;
//	}

}
