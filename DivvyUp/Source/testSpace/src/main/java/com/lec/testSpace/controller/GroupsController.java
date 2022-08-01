package com.lec.testSpace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.testSpace.dto.Groups;
import com.lec.testSpace.service.GroupsService;

@Controller
@RequestMapping(value="groups")
public class GroupsController {
	@Autowired
	private GroupsService groupsService;
	@RequestMapping(params="method=groupList", method= RequestMethod.GET)
	public String groupList(Model model, Groups groups) {
		model.addAttribute("groupList", groupsService.groupList());
		return "groups/groupList";
	}
}
