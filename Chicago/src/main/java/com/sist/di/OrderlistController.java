package com.sist.di;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.sist.dao.*;
import com.sist.service.*;

/* Made By Choding */
@Controller
public class OrderlistController {
	
	/* private */
	private static final Logger logger = LoggerFactory.getLogger(OrderlistController.class);
	
	@Resource(name="orderlistService")
	private OrderlistService ols;
	
	@Resource(name="bookService")
	private BookService bs;
	
	/* Member Orderlist Head And SideHead Menu */ 
	@RequestMapping("orderlist.do")
	public String orderlistMain_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/orderlist/OrderListMain.jsp");
			
		return "main/main";
		
	}
	
	/* Member Order SideMenu Include */
	@RequestMapping("memberOrderList.do")
	public String memberOrderlist_page(Model model, OrderlistVO vo, HttpServletRequest request, String typecheck, String page, String ss, String fs, String book_cnt) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		HttpSession hs = request.getSession();
		String sessionid = (String)hs.getAttribute("id");
		
		try {
			if(page == null) page = "1";
			if(book_cnt == null) book_cnt = "1";
			
			int cnt = Integer.parseInt(book_cnt);
			int curPage = Integer.parseInt(page);
			int rowSize = 7;
			int start = (curPage * rowSize) - (rowSize - 1);
			int end = curPage * rowSize;
			
			Map map = new HashMap();
			map.put("rowSize", rowSize);
			map.put("start", start);
			map.put("end", end);
			map.put("id", sessionid);
			map.put("cnt", cnt);
			
			List<OrderlistVO> list = null;
			int totalPage = 1;
			if(ss == null || ss.equals("")) {
				
				list = ols.selectOrderlist(map);
				totalPage = ols.selectOrderlistTotalPage(map);
				
			} else {
				
				/*map.put("ss", ss);
				model.addAttribute("ss", ss);
				list = */
				
				
			}

			int block = 10;
			int fromPage = ((curPage - 1) / block * block) + 1;
			int toPage = ((curPage - 1) / block * block) + block;
			
			
			if(toPage> totalPage) toPage = totalPage;			
			
			model.addAttribute("book_cnt", book_cnt);
			model.addAttribute("list", list);
			model.addAttribute("fromPage", fromPage);
			model.addAttribute("toPage", toPage);
			model.addAttribute("block", block);
			model.addAttribute("curPage", curPage);
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("start", start);
			model.addAttribute("end", end);
			
			model.addAttribute("cmi", "../member/orderlist/MemberOrderList.jsp");
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return "main/main";
		
	}
	
	@RequestMapping("guestOrderList.do")
	public String guestOrderlist_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/orderlist/GuestOrderList.jsp");
		
		return "main/main";
		
	}
	
	/* Member Question HeadMenu */ 
	@RequestMapping("memberquestion.do")
	public String member_question_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/memberquestion/MemberQuestionMain.jsp");
		
		return "main/main";
		
	}
	
}
