package com.lec.divvyup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.service.GroupBoardService;
import com.lec.divvyup.service.GroupDetailService;
import com.lec.divvyup.vo.GroupBoard;

@Controller
@RequestMapping(value = "groupboard")
public class GroupBoardController {

   @Autowired
   GroupDetailService groupDetailService;
   @Autowired
   GroupBoardService groupBoardService;


//   대화 리스트 20개 출력
   @RequestMapping(value = "groupChatBoard")
   public String listLatest20Groupboard(int gid, String mid, Model model, HttpSession session) {
     System.out.println("넘어온 세션 mid" + mid);
     System.out.println("넘어온 gid" + gid);
     session.setAttribute("sessionGBmid", mid);
     model.addAttribute("gbGid", gid);
     model.addAttribute("grouplist", groupBoardService.listLatest20Groupboard(gid, mid));
     return "groupBoard/groupChatBoardMain";
   }

//   지난 대화20개 가져오기
   @RequestMapping(value = "pastGroupBoardList", method = RequestMethod.GET)
   public String listPast20Groupboard(GroupBoard groupBoard, Model model) {
      model.addAttribute("pastList", groupBoardService.listPast20Groupboard(groupBoard));
      return "groupBoard/groupBoardPastList";
   }

//   글 입력
   @RequestMapping(value = "insertGroupBoard", method = RequestMethod.POST)
   public String insertGroupBoard(GroupBoard groupBoard, Model model, MultipartHttpServletRequest mRequest) {
      groupBoardService.insertGroupboard(groupBoard, mRequest);
      return "groupBoard/groupBoardInsert";
   }

//   타이머 글 가져오기
   @RequestMapping(value = "singleLatestGroupboard", method = RequestMethod.GET)
   public String singleLatestGroupboard(int gid, Model model) {
      model.addAttribute("singleLatestGroupboard", groupBoardService.singleLatestGroupboard(gid));
//      application.setAttribute("sessionMList", mlist);
      return "groupBoard/groupBoardSingleBoard";
   }

//   글 삭제
   @RequestMapping(value = "deleteGroupBoard", method = RequestMethod.GET)
   @ResponseBody
   public void deleteGroupBoard(int gbid, Model model) {
     groupBoardService.deleteGroupboard(gbid);
   }
}

