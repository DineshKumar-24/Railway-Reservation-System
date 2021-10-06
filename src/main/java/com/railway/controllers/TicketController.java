package com.railway.controllers;

import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.railway.entities.Ticket;
import com.railway.entities.Train;
import com.railway.entities.User;
import com.railway.service.TicketService;
import com.railway.service.TrainService;
import com.railway.service.UserService;

@Controller
public class TicketController {
	private static final Logger logger = LogManager.getLogger(TicketController.class);
	private static final String TICKET_DEATILS_PAGE = "admin/ticketdetails"; // Compliant

	@Autowired
	TrainService trainService;
	@Autowired
	TicketService ticketService;
	@Autowired
	UserService userService;

	@GetMapping("/viewtickets")
	public ModelAndView viewUserTickets(HttpServletRequest request) {
		logger.info("Getting ticket...");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		HashSet<Ticket> listOfTickets = new HashSet<>(ticketService.getUserTickets(user.getEmail()));
		logger.info("Tickets found for user with Id {}", user.getEmail());
		return new ModelAndView("yourtickets", "listOfTickets", listOfTickets);

	}
	
	@GetMapping("/ticketdetails")
	public String ticketDetailsPage() {
		return TICKET_DEATILS_PAGE;
	}

	@GetMapping("/getfulldetails")
	public ModelAndView getFullDetails(@RequestParam("trainName") String trainName) {
		logger.info("Searching for train tickets with the train name {}", trainName);
		Train train = trainService.getByTrainName(trainName);
		if (train != null) {
			logger.info("Train ticket details with the train name {} has found", trainName);
			List<Ticket> ticketDetails = train.getListOfTickets();
			return new ModelAndView(TICKET_DEATILS_PAGE, "ticketDetails", ticketDetails);
		} else {
			logger.info("Searching for train with the name {} Not found", trainName);
			return new ModelAndView(TICKET_DEATILS_PAGE, "noTrainFound",
					"No train available in this name " + "'" + trainName + "'");
		}

	}

	@GetMapping("/cancelticket/{ticketId}")
	public String cancelOrDeleteTicket(@PathVariable int ticketId, HttpSession session,
			RedirectAttributes redirectAttributes) {
		logger.info("Cancelling/deleting ticket....");
		User user = (User) session.getAttribute("currentUser");
		String trainName = ticketService.getByTicketId(ticketId).getTrainId().getTrainName();
		ticketService.increaseTicketCounts(ticketId);
		ticketService.cancelOrDeleteTicket(ticketId, user);
		redirectAttributes.addFlashAttribute("successfulmsg", "Ticket deleted with its corresponding passengers");
		logger.info("Ticket Cancelled or deleted Successful");
		if (user.getRole().equals("USER")) {
			return "redirect:/viewtickets";
		} else {

			return "redirect:/getfulldetails?trainName=" + trainName;

		}
	}
}
