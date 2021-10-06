package com.railway.controllers;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.railway.exceptions.CommonTrainException;
import com.railway.exceptions.CommonUserException;

@ControllerAdvice
public class ExceptionHandlerController {
	private static final Logger logger = LogManager.getLogger(ExceptionHandlerController.class);
	private static final String INDEX_PAGE = "index";

	@ExceptionHandler(CommonUserException.class)
	public ModelAndView handleAllExceptions(CommonUserException ex) {
		ModelAndView model =null;
		String errCode = ex.getErrCode();
		logger.warn("Inside User Exceptions..");
		switch (errCode) {
		case "E100":
		case "E101":
			model = viewForException(INDEX_PAGE, ex.getErrCode(), ex.getErrMsg());
			break;

		case "E102":
			model = viewForException("home", ex.getErrCode(), ex.getErrMsg());
			break;

		default:
			model = viewForException(INDEX_PAGE, ex.getErrCode(), ex.getErrMsg());
			break;
		}

		return model;

	}

	@ExceptionHandler(CommonTrainException.class)
	public ModelAndView handleAllExceptions(CommonTrainException ex) {
		ModelAndView model = null;
		String errCode = ex.getErrCode();
		logger.warn("Inside Admin/Train Exceptions..");
		switch (errCode) {
		case "E200":
			model = viewForException("admin/trainform", ex.getErrCode(), ex.getErrMsg());
			break;
		case "E201":
			model = viewForException("admin/viewtrains", ex.getErrCode(), ex.getErrMsg());
			break;
		default:
			model = viewForException(INDEX_PAGE, ex.getErrCode(), ex.getErrMsg());
			break;
		}
		return model;

	}

	@ExceptionHandler(Exception.class)
	public ModelAndView handleAllExceptions(Exception ex) {
		logger.info("Inside Common Exceptions");
		ModelAndView model = new ModelAndView();
		model.setViewName("error");
		model.addObject("errCode", ex.getClass());
		model.addObject("errMsg", ex.getMessage());
		return model;

	}

	public ModelAndView viewForException(String view, String errCode, String errMsg) {

		ModelAndView model = new ModelAndView();
		model.setViewName(view);
		model.addObject("errCode", errCode);
		model.addObject("errMsg", errMsg);
		return model;
	}

}
