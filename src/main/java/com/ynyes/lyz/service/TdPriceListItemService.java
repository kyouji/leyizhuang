package com.ynyes.lyz.service;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.xerces.impl.xpath.regex.REUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.ynyes.lyz.entity.TdPriceListItem;
import com.ynyes.lyz.repository.TdPriceListItemRepo;

@Service
@Transactional
public class TdPriceListItemService {

	@Autowired
	private TdPriceListItemRepo repository;

	public TdPriceListItem save(TdPriceListItem e) {
		if (null == e) {
			return null;
		}
		return repository.save(e);
	}
	/*
	 * 接口 数据查询
	 */
	public TdPriceListItem findByListHeaderId(Long listHeaderId)
	{
		if (listHeaderId == null)
		{
			return null;
		}
		return repository.findByListHeaderId(listHeaderId);
	}
	
	public TdPriceListItem findByListLineId(Long listLineId)
	{
		if (listLineId == null)
		{
			return null;
		}
		return repository.findByListLineId(listLineId);
	}
	
	//zhangji
	public List<TdPriceListItem> save(List<TdPriceListItem> e) {
		if (null == e) {
			return null;
		}
		return (List<TdPriceListItem>) repository.save(e);
	}

	public void delete(Long id) {
		if (null != id) {
			repository.delete(id);
		}
	}
	
	//zhangji
	public void delete(List<TdPriceListItem> e) {
		if (null != e) {
			repository.delete(e);
		}
	}

	public TdPriceListItem findOne(Long id) {
		if (null == id) {
			return null;
		}
		return repository.findOne(id);
	}

	public List<TdPriceListItem> findAll() {
		return (List<TdPriceListItem>) repository.findAll();
	}
	
	public Page<TdPriceListItem> findAll(int page, int size){
		PageRequest pageRequest = new PageRequest(page, size, new Sort(Direction.ASC, "sortId"));
		return repository.findAll(pageRequest);
	}
	
	public Page<TdPriceListItem> searchAll(String keywords, int page, int size){		
		if (null == keywords) {
			return null;
		}
		PageRequest pageRequest = new PageRequest(page, size, new Sort(Direction.ASC, "sortId"));
		return repository.findByPriceListNameContainingOrCityNameContainingOrCompanyNameContaining(keywords, keywords, keywords, pageRequest);
	}

	/**
	 * 根据价目表编号和首页推荐查找价目表项（分页）
	 * 
	 * @author dengxiao
	 */
	public Page<TdPriceListItem> findByPriceListIdAndIsCommendIndexTrueOrderBySortIdAsc(Long PriceListId,
			int size, int page) {
		if (null == PriceListId) {
			return null;
		}
		PageRequest pageRequest = new PageRequest(page, size);
		return repository.findByPriceListIdAndIsCommendIndexTrueOrderBySortIdAsc(PriceListId, pageRequest);
	}

	/**
	 * 查找所有参与促销的商品（不分页）
	 * 
	 * @author dengxiao
	 */
	public List<TdPriceListItem> findByPriceListIdAndIsPromotionTrueOrderBySortIdAsc(Long PriceListId) {
		if (null == PriceListId) {
			return null;
		}
		return repository.findByPriceListIdAndIsPromotionTrueOrderBySortIdAsc(PriceListId);
	};

	//zhangji
	public List<TdPriceListItem> findByPriceListIdOrderBySortIdAsc(Long PriceListId) {
		if (null == PriceListId) {
			return null;
		}
		return repository.findByPriceListIdOrderBySortIdAsc(PriceListId);
	};
//	public Page<TdPriceList> searchAll(String keywords, int page, int size) {
//		if (null == keywords) {
//			return null;
//		}
//		PageRequest pageRequest = new PageRequest(page, size, new Sort(Direction.ASC, "sortId"));
//		return repository
//				.findByPriceListIdContainingOrpriceListNameContainingOrcityNameContainingOrCompanyNameContaining(
//						keywords, keywords, keywords, keywords, pageRequest);
//	}

	/**
	 * 根据价目表名称和商品id查找价目表项
	 * 
	 * @author dengxiao
	 */
	public TdPriceListItem findByPriceListIdAndGoodsId(Long priceListId, Long goodsId) {
		if (null == priceListId || null == goodsId) {
			return null;
		}
		return repository.findByPriceListIdAndGoodsId(priceListId, goodsId);
	}
}
