package com.lec.ch15.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ch15.model.Emp;
import com.lec.ch15.util.Paging;

@Controller
public class EmpController {
	@Autowired
	private com.lec.ch15.service.EmpService empService;
	@RequestMapping(value="empList", method = RequestMethod.GET)
	public String empList(String pageNum, Model model) {
		// empList.do?pageNum=2, empList.do
		model.addAttribute("empList", empService.empList(pageNum));
		model.addAttribute("paging", new Paging(empService.totCnt(), pageNum, 10, 5));
		return "empList";
	}
	@RequestMapping(value="dummyDataInsert",method=RequestMethod.GET)
	public String dummyDataInsert() {
		empService.dummyDataInsert50();
		return "redirect:empList.do";
	}
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(String pageNum, int empno, Model model) {
		model.addAttribute("detail", empService.detail(empno));
		model.addAttribute("pageNum", pageNum);
		return "detail";
	}
	@RequestMapping(value="empDeptList", method = {RequestMethod.GET, RequestMethod.POST})
	public String empDeptList(String pageNum, Model model) {
		// empList.do?pageNum=2, empList.do
		model.addAttribute("empDeptList", empService.empDeptList(pageNum));
		model.addAttribute("paging", new Paging(empService.totCnt(), pageNum, 10, 5));
		return "empDeptList";
	}
	@RequestMapping(value="insert", method=RequestMethod.GET)
	public String insertForm(Model model) {
		model.addAttribute("managerList", empService.managerList());
		model.addAttribute("deptList", empService.deptList());
		return "insert";
	}
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(Emp emp, Model model) {
			model.addAttribute("insertResult", empService.insert(emp));
			return "forward:empDeptList.do";
}
	@RequestMapping(value="updateView", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateView(int empno, Model model) {
			model.addAttribute("empDto", empService.detail(empno));
			return "update";
}
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update(Emp emp, Model model) {
		try {
			model.addAttribute("updateResult", empService.update(emp));
		} catch (Exception e) {
			model.addAttribute("updateResult", "Inserted information is too long. Update fail");
			return "forward:updateView.do";
		}
			return "forward:empDeptList.do";
}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int pageNum, int empno, Model model){
		try {
			empService.delete(empno);
		}catch(Exception e){ }
		return "redirect:empDeptList.do?pageNum="+pageNum;
	}
	@RequestMapping(value = "confirmNo", method = RequestMethod.GET)
	public String confirmNo(int empno, Model model) {
		if(empService.detail(empno) == null) {
			model.addAttribute("msg", "사용가능한 사번입니다");
		}else {
			model.addAttribute("msg", "중복된 사번은 사용불가합니다");
		}
		return "forward:insert.do";
	}
}