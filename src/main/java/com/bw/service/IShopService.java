package com.bw.service;

import java.util.List;

import com.bw.entity.Page;
import com.bw.entity.Shop;
import com.bw.entity.Type;

public interface IShopService {
	List<Shop> getpageconditions(Page page);
	int delete(String id);
	int add(Shop shop);
	
	List<Type> getAll();
}
