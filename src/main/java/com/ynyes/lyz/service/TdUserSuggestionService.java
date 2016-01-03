package com.ynyes.lyz.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.ynyes.lyz.entity.TdUserSuggestion;
import com.ynyes.lyz.repository.TdUserSuggestionRepo;

@Service
@Transactional
public class TdUserSuggestionService {

	@Autowired
	private TdUserSuggestionRepo repository;
	
	public TdUserSuggestion save(TdUserSuggestion e){
		if(null == e){
			return null;
		}
		return repository.save(e);
	}
	
	public void delete(Long id){
		if(null != id){
			repository.delete(id);
		}
	}
	
	public TdUserSuggestion findOne(Long id){
		if(null == id){
			return null;
		}
		return repository.findOne(id);
	}
	
	public List<TdUserSuggestion> findAll(){
		return (List<TdUserSuggestion>) repository.findAll();
	}
	
	/**
	 * 列表页面 按sortId排序 其次时间倒序
	 * @author zhangji
	 * @return
	 */
	public Page<TdUserSuggestion> findAll(int page , int size){
		PageRequest pageRequest = new PageRequest(page, size, new Sort(Direction.ASC, "sortId").and(new Sort(Direction.DESC, "createTime"))
				.and(new Sort(Direction.ASC,"id")));
		return  repository.findAll(pageRequest);
	}
}
