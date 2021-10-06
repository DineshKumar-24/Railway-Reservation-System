package com.railway.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.railway.dto.TrainDTO;
import com.railway.entities.Train;
import com.railway.service.TrainService;


@Controller
public class TrainController {
	private static final Logger logger = LogManager.getLogger(TrainController.class);
	private static final String SUCCESS_TOAST_MSG = "successfulmsg"; //
	@Autowired
	TrainService trainService;

	@PostMapping("/addtrain")
	public String addTrain(@ModelAttribute TrainDTO train, RedirectAttributes redirectAttributes) {
		logger.info("Adding New Train....");
		trainService.createTrain(train.convertToEntity());
		logger.info("New train with {} added successful", train.getTrainNo());
		redirectAttributes.addFlashAttribute(SUCCESS_TOAST_MSG, "Train added Successful");
		return "redirect:/trainform";
	}

	@GetMapping("/viewtrains")
	public ModelAndView viewTrains() {
		logger.info("Getting List of Trains...");
		List<Train> listOfTrains = trainService.getAllTrains();
		return new ModelAndView("admin/viewtrains", "listOfTrains", listOfTrains);
	}

	@GetMapping("/deletetrain/{trainNo}")
	public String deleteTrain(@PathVariable String trainNo, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		logger.info("Tring to delete train with No {}", trainNo);
		trainService.deleteTrain(trainNo);
		redirectAttributes.addFlashAttribute(SUCCESS_TOAST_MSG, "Train deleted Successful");
		logger.info("Train with {} deleted Successful", trainNo);
		return "redirect:/viewtrains";

	}

	@PostMapping("/updatetrain")
	public String updateTrain(@ModelAttribute TrainDTO train, RedirectAttributes redirectAttributes) {
		logger.info("Updating train with {}...", train.getTrainNo());
		trainService.updateTrain(train.convertToEntity());
		logger.info("Train with {} updated successful", train.getTrainNo());
		redirectAttributes.addFlashAttribute(SUCCESS_TOAST_MSG, "Train updated Successful");
		return "redirect:/viewtrains";
	}

	@GetMapping("/updateTrainModal/{trainNo}")
	public ModelAndView redirectUpdateModal(@PathVariable String trainNo) {
		Train updateTrainObj = trainService.getByTrainNo(trainNo);
		logger.info("opening form for updating train...");
		return new ModelAndView("/admin/updateTrain", "updateTrainObj", updateTrainObj);

	}

	@PostMapping("/available/trains")
	public ModelAndView availableTrains(@RequestParam("source") String source,
			@RequestParam("destination") String destination, @RequestParam("date") String date, Model model) {

		logger.info("Getting available trains from {} to {}", source, destination);
		List<Train> listOfAvailTrains = trainService.getBySourceAndDestinationAndDate(source, destination, date);
		if (listOfAvailTrains.isEmpty()) {
			logger.info("No trains available for given location");
			return new ModelAndView("home", "noTrains", "No trains available for the given location");
		}
		return new ModelAndView("availabletrains", "listOfAvailTrains", listOfAvailTrains);

	}

}
