package com.ynyes.cheyou.controller.front;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;

import com.cytm.payment.ceb.CEBPayConfig;
import com.ynyes.cheyou.entity.TdPayType;
import com.ynyes.cheyou.service.TdPayTypeService;

public class AbstractPaytypeService {
    @Autowired
    protected TdPayTypeService tdPayTypeService;
    
    protected void setPayTypes(ModelMap map) {
        List<TdPayType> pay_type_list = tdPayTypeService.findByIsEnableTrue();
        List<TdPayType> pay_type_list_bank = new ArrayList<TdPayType>();
        List<TdPayType> pay_type_list_third = new ArrayList<TdPayType>();
        Set<String> supportedBanks = CEBPayConfig.INTER_B2C_BANK_CONFIG.keySet();
        for(int i = 0; i < pay_type_list.size(); i++) {
            TdPayType payType = pay_type_list.get(i);
            if(supportedBanks.contains(payType.getCode())) {
                pay_type_list_bank.add(payType);
            } else {
                pay_type_list_third.add(payType);
            }
        }
        
        // 网上银行
        map.addAttribute("pay_type_list_bank", pay_type_list_bank);
        
        // 三方支付
        map.addAttribute("pay_type_list_third", pay_type_list_third);
    }
}
