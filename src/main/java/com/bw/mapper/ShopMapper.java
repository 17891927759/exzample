package com.bw.mapper;

import java.util.List;

import com.bw.entity.Page;
import com.bw.entity.Shop;

public interface ShopMapper {
	List<Shop> getpageconditions(Page page);
	int getCount(Page page);
	int delete(String id);
	int add(Shop shop);
}
