package controller.member.message;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.Member_DTO;
import model.Message_DTO;

	@Controller
	public class Msg_Controller {
		
		@Autowired
		Msg_DAO msg_dao;
		
		private Object msg_detail;
				
		public Msg_DAO getMsg_dao() {
			return msg_dao;
		}

		public void setMsg_dao(Msg_DAO msg_dao) {
			this.msg_dao = msg_dao;
		}


		/*����������*/
		@RequestMapping("msg_receive_list.do")
		public String msgrcv(Model model, HttpSession session){

			Member_DTO member = (Member_DTO) session.getAttribute("login");
			session.setAttribute("login", member);
			
			
			List<Message_DTO> list = msg_dao.select_rcvList(member.getMem_no()); 

			model.addAttribute("list", list);
			
			System.out.println("����Ʈ: "+list);
			
			if(member.getMem_type().equals("관리자")) {
			return "admin/message/msg_receive_list";
			}
			return "mem/message/msg_receive_list";
			}
		
		/*����������*/
		@RequestMapping("msg_send_list.do")
		public String msgsen(Model model, HttpSession session){

			Member_DTO member = (Member_DTO) session.getAttribute("login");
			session.setAttribute("login", member);
			
			
			List<Message_DTO> list = msg_dao.select_senList(member.getMem_no()); 

			model.addAttribute("list", list);

			System.out.println("����Ʈ: "+list);
			
			if(member.getMem_type().equals("관리자")) {
			return "admin/message/msg_send_list";
			}
			return "mem/message/msg_send_list";
			}
		
		/*���� ��������*/
		@RequestMapping("msg_detail.do")
		public String rcvdetail(Model model, int msg_no, HttpSession session) {
			Message_DTO msg_detail = msg_dao.select_datail(msg_no);
			Member_DTO member = (Member_DTO) session.getAttribute("login");
			
			model.addAttribute("msg_detail", msg_detail);
			
			if(member.getMem_type().equals("관리자")) {
			return "admin/message/msg_detail";
			}
			return "mem/message/msg_detail";
		}
		
		/*���� ����*/
		
		
		@RequestMapping(value="msg_writeForm.do", method = RequestMethod.GET)
		public String form(Model model, HttpSession session) {
			Member_DTO member = (Member_DTO) session.getAttribute("login");
			session.setAttribute("login", member);
			
			
			List<HashMap> list = msg_dao.msgselect(); 

			model.addAttribute("list", list);
			if(member.getMem_type().equals("관리자")) {
			return "admin/message/msg_writeForm";
			}
			return "mem/message/msg_writeForm";
		}
		
		@RequestMapping(value="msg_send_list.do", method = RequestMethod.POST)
		public String submit(Message_DTO message_DTO, HttpSession session) {
			Member_DTO member=(Member_DTO) session.getAttribute("login"); 
			session.setAttribute("login", member);
			
			message_DTO.setMsg_sender(member.getMem_no());
			Timestamp msg_date = new Timestamp(System.currentTimeMillis());
			message_DTO.setMsg_date(msg_date);
			
			msg_dao.msg_write(message_DTO);

			return "redirect:msg_send_list.do";
			
		}
		
		
		//쪽지 삭제
		@RequestMapping("Msg_delete.do")
		public String delete(int msg_no, Model model, HttpSession session) {
			
			Member_DTO mdto = (Member_DTO) session.getAttribute("login");
			
			Message_DTO msg_detail = msg_dao.select_datail(msg_no);
			model.addAttribute("msg_detail", msg_detail);

			msg_dao.deleteMsg(msg_no) ;
			
			System.out.println("msg_detail의" +msg_detail.getMsg_sender());
			
			if(mdto.getMem_no() == msg_detail.getMsg_sender()) {
				
						return "redirect:msg_send_list.do";
				}
			
					return "redirect:msg_receive_list.do";
				
				}
			}

