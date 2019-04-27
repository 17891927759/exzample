package com.bw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.entity.Page;
import com.bw.entity.Shop;
import com.bw.entity.Type;
import com.bw.mapper.ShopMapper;
import com.bw.mapper.TypeMapper;
@Service
public class ShopService implements IShopService {
	@Autowired
	private TypeMapper typeMapper;
	@Autowired
	private ShopMapper shopMapper;
	@Override
	public List<Shop> getpageconditions(Page page) {
		// TODO Auto-generated method stub
		int count = shopMapper.getCount(page);
		page.setTotalData(count);
		List<Shop> list = shopMapper.getpageconditions(page);
		return list;
	}

	@Override
	public List<Type> getAll() {
		// TODO Auto-generated method stub
		return typeMapper.getAll();
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return shopMapper.delete(id);
	}

	@Override
	public int add(Shop shop) {
		// TODO Auto-generated method stub
		return shopMapper.add(shop);
	}

}
