package com.ynyes.zphk.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.ynyes.zphk.entity.TdUserLowPriceRemind;
import com.ynyes.zphk.repository.TdUserLowPriceRemindRepo;

@Service
@Transactional
public class TdUserLowPriceRemindService {

	@Autowired
	TdUserLowPriceRemindRepo repository;

	public TdUserLowPriceRemind save(TdUserLowPriceRemind e) {
		return repository.save(e);
	}

	public TdUserLowPriceRemind findOne(Long id) {
		if (null == id) {
			return null;
		}
		return repository.findOne(id);
	}

	public List<TdUserLowPriceRemind> findAll() {
		return (List<TdUserLowPriceRemind>) repository.findAll();
	}

	public void delete(Long id) {
		if (null != id) {
			repository.delete(id);
		}
	}

	public List<TdUserLowPriceRemind> findByGoodsId(Long goodsId) {
		if (null == goodsId) {
			return null;
		}
		return repository.findByGoodsId(goodsId);
	}

	public TdUserLowPriceRemind findByGoodsIdAndUsername(Long goodsId, String username) {
		if (null == goodsId || null == username) {
			return null;
		}
		return repository.findByGoodsIdAndUsername(goodsId, username);
	}

	public Page<TdUserLowPriceRemind> findByUsernameOrderByAddTimeDesc(String username, int page, int size) {
		PageRequest pageRequest = new PageRequest(page, size);
		return repository.findByUsernameOrderByAddTimeDesc(username, pageRequest);
	};
}
