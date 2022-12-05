package com.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.business.BusinessCurrency;
import com.entity.Currency;

@RestController
@RequestMapping("exchange")
public class ExchangeController {
	BusinessCurrency businessCurrency = new BusinessCurrency();
	
	@RequestMapping("")
	public ModelAndView search(ModelMap model, 
			@RequestParam(name = "fromCode", required = false) String fromCode,
			@RequestParam("toCode") Optional<String> toCode,
			@RequestParam("amount") Optional<String> amount)
	throws IOException, ParseException {
		String amountDouble = amount.orElse("1.0");
		String toCodeString = toCode.orElse("VND");
		String result = businessCurrency.getRateWithAmount(fromCode, toCodeString, Double.valueOf(amountDouble));
		
		
		List<Currency> currencies = businessCurrency.getAllCurrencies();
		String json = businessCurrency.getTop30RatesWithAmountJson(fromCode, toCodeString, Double.valueOf(amountDouble));
		
		ModelAndView mav = new ModelAndView("index");
		
//		model.addAttribute("result", result);
//		model.addAttribute("json", json);
//		model.addAttribute("symbols", currencies);
//		
//		model.addAttribute("fromCode", fromCode);
//		model.addAttribute("toCode", toCodeString);
//		model.addAttribute("amount", amountDouble);
		
		mav.addObject("result", result);
		mav.addObject("json", json);
		mav.addObject("symbols", currencies);
		mav.addObject("fromCode", fromCode);
		mav.addObject("toCode", toCodeString);
		mav.addObject("amount", amountDouble);

		return mav;
	}
}
