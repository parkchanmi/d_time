package controller.member.orders;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.Member_DTO;
import model.Orders_DTO;
import model.Product_DTO;

@Controller
public class Member_Orders_Controller {
	@Autowired
	Member_Orders_DAO orders;

	public Member_Orders_DAO getOrders() {
		return orders;
	}

	public void setOrders(Member_Orders_DAO orders) {
		this.orders = orders;
	}

	@RequestMapping(value = "orders_addForm.do", method = RequestMethod.GET)
	public ModelAndView orders_addForm(ModelAndView mav, Product_DTO Product_DTO) {

		List<Product_DTO> list = orders.orders_add(1);

		mav.addObject("list", list);
		mav.setViewName("orders/orders_addForm");

		return mav;
	}

	@RequestMapping(value = "orders_addForm.do", method = RequestMethod.POST)
	public ModelAndView orders_drink(HttpSession session, ModelAndView mav, String[] umryo, int[] umryo_num, String[] sikpoom,
			int[] sikpoom_num, String[] sangpoom, int[] sangpoom_num, String[] somopoom, int[] somopoom_num) {

		String umryo_add = "";
		String sikpoom_add = "";
		String sangpoom_add = "";
		String somopoom_add = "";

		for (int i = 0; i < umryo.length; i++) // ���� ���ڿ� �����
		{
			if (umryo_num[i] == 0)
				continue;

			int std = orders.calc_std(umryo[i]);

			if (umryo_add.equals(""))
				umryo_add += umryo[i] + "," + umryo_num[i] * std;
			else
				umryo_add += "," + umryo[i] + "," + umryo_num[i] * std;

		}

		for (int i = 0; i < sikpoom.length; i++) // ��ǰ ���ڿ� �����
		{
			if (sikpoom_num[i] == 0)
				continue;

			int std = orders.calc_std(sikpoom[i]);

			if (sikpoom_add.equals(""))
				sikpoom_add += sikpoom[i] + "," + sikpoom_num[i] * std;
			else
				sikpoom_add += "," + sikpoom[i] + "," + sikpoom_num[i] * std;
		}

		for (int i = 0; i < sangpoom.length; i++) // ��ǰ ���ڿ� �����
		{
			if (sikpoom_num[i] == 0)
				continue;

			int std = orders.calc_std(sangpoom[i]);
			
			if (sangpoom_add.equals(""))
				sangpoom_add += sangpoom[i] + "," + sangpoom_num[i] * std;
			else
				sangpoom_add += "," + sangpoom[i] + "," + sangpoom_num[i] * std;
		}

		for (int i = 0; i < somopoom.length; i++) // �Ҹ�ǰ ���ڿ� �����
		{
			if (somopoom_num[i] == 0)
				continue;
			
			int std = orders.calc_std(somopoom[i]);
			
			if (somopoom_add.equals(""))
				somopoom_add += somopoom[i] + "," + somopoom_num[i] * std;
			else
				somopoom_add += "," + somopoom[i] + "," + somopoom_num[i] * std;
		}

		Orders_DTO o_dto = new Orders_DTO(umryo_add, sikpoom_add, sangpoom_add, somopoom_add);

		Timestamp time = new Timestamp(System.currentTimeMillis());
		o_dto.setO_date(time);
		Member_DTO session_member=(Member_DTO) session.getAttribute("login"); 
		if(session_member==null) { 
			mav.setViewName("redirect:index.jsp");
			return mav;
		}
		
		int s_no = session_member.getS_no();
		o_dto.setS_no(s_no);
		
		int x = orders.orders_add(o_dto);

		List<Product_DTO> list = orders.orders_add(1);

		mav.addObject("list", list);
		mav.setViewName("orders/orders_addForm");
		return mav;
	}

	@RequestMapping(value = "orders_list.do", method = RequestMethod.GET)
	public ModelAndView orders_list(ModelAndView mav, Orders_DTO Orders_DTO, HttpSession request) {

		List<Orders_DTO> list = orders.order_List(1);
		int count = orders.order_count(1);

		mav.addObject("count", count);

		mav.addObject("list", list);
		mav.setViewName("orders/orders_list");

		return mav;

	}

	@RequestMapping(value = "orders_content.do", method = RequestMethod.GET)
	public ModelAndView orders_content(ModelAndView mav, Orders_DTO Orders_DTO,int o_no) {

		Orders_DTO split = orders.orders_content(o_no);

		String umryo_split = split.getO_drink();
		String sikpoom_split = split.getO_food();
		String sangpoom_split = split.getO_product();
		String somopoom_split = split.getO_thing();

		String[] umryo_splited = umryo_split.split(","); // ���� ������
		List<HashMap> um_list = new ArrayList<HashMap>();
		if (umryo_splited.length != 0) {
			HashMap umryo_div=null;
			for (int i = 0; i < umryo_splited.length; i = i + 2) {
				umryo_div = new HashMap();
				umryo_div.put("umryo", umryo_splited[i]); // 원두
				umryo_div.put("umryo_num", Integer.parseInt(umryo_splited[i + 1])); // 3
				um_list.add(umryo_div);
			}

			mav.addObject("um_list", um_list);
		}
		String[] sikpoom_splited = sikpoom_split.split(","); // ��ǰ ������
		List<HashMap> sik_list = new ArrayList<HashMap>();

		if (sikpoom_splited.length != 0) {

			HashMap sikpoom_div = null;

			for (int i = 0; i < sikpoom_splited.length; i = i + 2) {
				sikpoom_div = new HashMap();
				sikpoom_div.put("sikpoom", sikpoom_splited[i]);
				sikpoom_div.put("sikpoom_num", Integer.parseInt(sikpoom_splited[i + 1]));

				
				sik_list.add(sikpoom_div);
			}
			
			mav.addObject("sik_list", sik_list);

		}

		String[] sangpoom_splited = sangpoom_split.split(","); // ��ǰ ������

		List<HashMap> sang_list = new ArrayList<HashMap>();
		if (sangpoom_splited.length != 0) {

			HashMap sangpoom_div = null;
			for (int i = 0; i < sangpoom_splited.length; i = i + 2) {
				sangpoom_div = new HashMap();
				sangpoom_div.put("sangpoom", sangpoom_splited[i]);
				sangpoom_div.put("sangpoom_num", Integer.parseInt(sangpoom_splited[i + 1]));
				
				sang_list.add(sangpoom_div);
			}
			mav.addObject("sang_list", sang_list);

		}

		String[] somopoom_splited = somopoom_split.split(","); // �Ҹ�ǰ ������
		List<HashMap> somo_list = new ArrayList<HashMap>();
		if (somopoom_splited.length != 0) {

			HashMap somopoom_div = null;
			for (int i = 0; i < somopoom_splited.length; i = i + 2) {
				somopoom_div = new HashMap();
				somopoom_div.put("somopoom", somopoom_splited[i]);
				somopoom_div.put("somopoom_num", Integer.parseInt(somopoom_splited[i + 1]));
			
				somo_list.add(somopoom_div);
			}
			mav.addObject("somo_list", somo_list);
		}

		mav.setViewName("orders/orders_content");
		return mav;

	}

}
