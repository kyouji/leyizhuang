package com.ynyes.lyz.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.ynyes.lyz.entity.TdSubdistrict;
import com.ynyes.lyz.repository.TdSubdistrictRepo;

@Service
@Transactional
public class TdSubdistrictService {

	@Autowired
	private TdSubdistrictRepo repository;
	
	@Autowired
	private TdDistrictService tdDistrictService;

	public TdSubdistrict save(TdSubdistrict e) {
		if (null == e) 
		{
			return null;
		}
		
		e.setDistrictName(tdDistrictService.findOne(e.getDistrictId()).getCityName());
		
		return repository.save(e);
	}

	public void delete(Long id) {
		if (null != id) {
			repository.delete(id);
		}
	}

	public TdSubdistrict findOne(Long id) {
		if (null == id) {
			return null;
		}
		return repository.findOne(id);
	}

	public List<TdSubdistrict> findAll() {
		return (List<TdSubdistrict>) repository.findAll();
	}

	/**
	 * 根据所属区划id查找街道，并按照排序号正序排序
	 * 
	 * @author dengxiao
	 */
	public List<TdSubdistrict> findByDistrictIdOrderBySortIdAsc(Long districtId) {
		if (null == districtId) {
			return null;
		}
		return repository.findByDistrictIdOrderBySortIdAsc(districtId);
	}
	

	public Page<TdSubdistrict> findAll(int page, int size)
    {
		
        PageRequest pageRequest = new PageRequest(page, size, new Sort(Direction.DESC, "sortId"));
        
        return repository.findAll(pageRequest);
    }
}
