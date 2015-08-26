package com.ynyes.zphk.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.zphk.entity.TdUserLowPriceRemind;

public interface TdUserLowPriceRemindRepo
		extends PagingAndSortingRepository<TdUserLowPriceRemind, Long>, JpaSpecificationExecutor<TdUserLowPriceRemind> {

	List<TdUserLowPriceRemind> findByGoodsId(Long goodsId);
	
	TdUserLowPriceRemind findByGoodsIdAndUsername(Long goodsId,String username);
	
	Page<TdUserLowPriceRemind> findByUsernameOrderByAddTimeDesc(String username, Pageable page);
}
