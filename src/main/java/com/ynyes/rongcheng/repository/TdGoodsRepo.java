package com.ynyes.rongcheng.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.TdGoods;

/**
 * TdGoods 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface TdGoodsRepo extends
		PagingAndSortingRepository<TdGoods, Long>,
		JpaSpecificationExecutor<TdGoods> 
{
    Page<TdGoods> findByCategoryIdTreeContainingAndIsOnSaleTrue(String categoryId, Pageable page);
    
    Page<TdGoods> findByCategoryIdTreeContainingAndIsRecommendTypeTrueAndIsOnSaleTrueOrderByIdDesc(String categoryId, Pageable page);
    
    Page<TdGoods> findByIsRecommendTypeTrueAndIsOnSaleTrueOrderByIdDesc(Pageable page);
    
    Page<TdGoods> findByCategoryIdTreeContainingAndIsRecommendIndexTrueAndIsOnSaleTrueOrderByIdDesc(String categoryId, Pageable page);
    
    Page<TdGoods> findByCategoryIdTreeContainingAndIsOnSaleTrueOrderBySoldNumberDesc(String categoryId, Pageable page);
    
    List<TdGoods> findTop10ByIsOnSaleTrueOrderBySoldNumberDesc();
    
    Page<TdGoods> findByIsOnSaleTrue(Pageable page);
    
    List<TdGoods> findByIdAndIsOnSaleTrue(Iterable<Long> ids);
    
    Page<TdGoods> findByCategoryId(Long catId, Pageable page);
    
    Page<TdGoods> findByCategoryIdOrderBySortIdAsc(Long catId, Pageable page);
    
    Page<TdGoods> findByCategoryIdAndIsOnSaleTrue(Long catId, Pageable page);
    
    Page<TdGoods> findByTitleContainingOrSubTitleContainingOrDetailContainingOrderBySortIdAsc(String keywords1, String keywords2, String keywords3, Pageable page);
    
    Page<TdGoods> findByCategoryIdAndTitleContainingOrCategoryIdAndSubTitleContainingOrCategoryIdAndDetailContainingOrderBySortIdAsc(Long catId1,
            String keywords1, 
            Long catId2,
            String keywords2, 
            Long catId3,
            String keywords3, Pageable page);
    
    Page<TdGoods> findByCategoryIdTreeContainingAndLeftNumberGreaterThanAndSalePriceBetweenAndParamValueCollectLikeAndIsOnSaleTrue(String categoryId, Long leftNumber, Double priceLow, Double priceHigh, String paramStr, Pageable page);
    
    Page<TdGoods> findByCategoryIdTreeContainingAndBrandIdAndLeftNumberGreaterThanAndSalePriceBetweenAndParamValueCollectLikeAndIsOnSaleTrue(String categoryId, Long brandId, Long leftNumber, Double priceLow, Double priceHigh, String paramStr, Pageable page);

    Page<TdGoods> findByCategoryIdTreeContainingAndLeftNumberGreaterThanAndParamValueCollectLikeAndIsOnSaleTrue(String categoryId, Long leftNumber, String paramStr, Pageable page);
    
    Page<TdGoods> findByCategoryIdTreeContainingAndBrandIdAndLeftNumberGreaterThanAndParamValueCollectLikeAndIsOnSaleTrue(String categoryId, Long brandId, Long leftNumber, String paramStr, Pageable page);

    Page<TdGoods> findByCategoryIdTreeContainingAndSalePriceBetweenAndParamValueCollectLikeAndIsOnSaleTrue(String categoryId, Double priceLow, Double priceHigh, String paramStr, Pageable page);
    
    Page<TdGoods> findByCategoryIdTreeContainingAndBrandIdAndSalePriceBetweenAndParamValueCollectLikeAndIsOnSaleTrue(String categoryId, Long brandId, Double priceLow, Double priceHigh, String paramStr, Pageable page);

    Page<TdGoods> findByCategoryIdTreeContainingAndParamValueCollectLikeAndIsOnSaleTrue(String categoryId, String paramStr, Pageable page);
    
    Page<TdGoods> findByCategoryIdTreeContainingAndBrandIdAndParamValueCollectLikeAndIsOnSaleTrue(String categoryId, Long brandId, String paramStr, Pageable page);

    Page<TdGoods> findByIsGroupSaleTrueAndGroupSaleStopTimeAfterAndIsOnSaleTrueOrderByGroupSaleStartTimeAsc(Date current, Pageable page);
    
    Page<TdGoods> findByIsGroupSaleTrueAndGroupSaleStopTimeAfterAndGroupSaleStartTimeBeforeAndIsOnSaleTrueOrderByGroupSaleStartTimeAsc(Date current, Date current1, Pageable page);
    
    Page<TdGoods> findByIsGroupSaleTrueAndGroupSaleStopTimeAfterAndGroupSaleStartTimeAfterAndIsOnSaleTrueOrderByGroupSaleStartTimeAsc(Date current, Date current1, Pageable page);
    
    Page<TdGoods> findByIsGroupSaleTrueAndIsOnSaleTrueOrderByGroupSaleStartTimeAsc(Pageable page);
    
    Page<TdGoods> findByTitleContainingAndIsOnSaleTrueOrSubTitleContainingAndIsOnSaleTrueOrParamValueCollectContainingAndIsOnSaleTrueOrDetailContainingAndIsOnSaleTrue(String key1,
            String key2,
            String key3,
            String key4,
            Pageable page);
    
    List<TdGoods> findByProductIdAndIsOnSaleTrue(Long productId);
    
    Page<TdGoods> findByReturnPriceNotAndIsOnSaleTrue(double returnPrice, Pageable page);
    
    Page<TdGoods> findByReturnPriceNotAndTitleContainingAndIsOnSaleTrue(double returnPrice, String keywords, Pageable page);
}
