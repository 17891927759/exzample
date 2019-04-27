package com.bw.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bw.entity.Page;
import com.bw.entity.Shop;
import com.bw.entity.Type;
import com.bw.service.IShopService;

@Controller
@RequestMapping("shop")
public class ShopController {
	@Autowired
	private IShopService shopService;
	//分页加模糊查询
	@RequestMapping("viewMain")
	public String viewMain(Page page,Model model){
		List<Shop> list = shopService.getpageconditions(page);
		model.addAttribute("list", list);
		return "/main.jsp";
	}
	@RequestMapping("delete")
	@ResponseBody
	public int delete(String id){
		int i = shopService.delete(id);
		return i;
	}
	@RequestMapping("gettype")
	@ResponseBody
	public List<Type> gettype(){
		List<Type> all = shopService.getAll();
		return all;
	}
	@RequestMapping("add")
	public String add(MultipartFile file,Shop shop,HttpSession session) throws IllegalStateException, IOException{
		//if(file.getSize()>0){
			String realPath = session.getServletContext().getRealPath("/upload");
			String Filename = UUID.randomUUID()+"_"+file.getOriginalFilename();
			String path=realPath+"/"+Filename;
			file.transferTo(new File(path));
			shop.setPhoto(Filename);
		//}
		int i = shopService.add(shop);
		return "redirect:/shop/viewMain.do";
		
}}
