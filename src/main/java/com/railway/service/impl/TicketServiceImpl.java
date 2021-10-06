package com.railway.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railway.dto.PassengerDTO;
import com.railway.entities.Passenger;
import com.railway.entities.Ticket;
import com.railway.entities.Train;
import com.railway.entities.User;

import com.railway.exceptions.CommonUserException;
import com.railway.repositories.TicketRepository;
import com.railway.repositories.TrainRepository;
import com.railway.repositories.UserRepository;
import com.railway.service.TicketService;
import com.railway.service.TrainService;
import com.railway.service.UserService;

@Service
public class TicketServiceImpl implements TicketService {
	private static final Logger logger = LogManager.getLogger(TicketServiceImpl.class);
	@Autowired
	TicketRepository ticketRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	UserService userService;
	@Autowired
	TrainService trainService;
	@Autowired
	TrainRepository trainRepository;

	@Override
	public int getTotalAmount(ArrayList<PassengerDTO> listOfPassenger) {
		int totalAmount = 0;
		for (PassengerDTO p : listOfPassenger) {
			if (p.getSeatPreference().equals("2S"))
				totalAmount += 150;
			else if (p.getSeatPreference().equals("SL"))
				totalAmount += 380;
			else
				totalAmount += 600;
		}
		logger.info("Total Amount to pay {}", totalAmount);
		return totalAmount;
	}

	@Override
	public void createTicket(User user, Train train,  ArrayList<PassengerDTO> listOfPassengerDTO, int totalAmount) {
		logger.info("Creating ticket for user with Id {}", user.getEmail());
		ArrayList<Passenger> listOfPassenger=new ArrayList<>();
		User user1 = userService.getUserById(user.getEmail());
		Ticket ticket = new Ticket();
		ticket.setNoOfTickets(listOfPassengerDTO.size());
		ticket.setTrainId(train);
		ticket.setUserId(user1);
		ticket.setAmountPaid(totalAmount);
		for (PassengerDTO p : listOfPassengerDTO) {
			listOfPassenger.add(p.convertToEntity());
			
		}
		for(Passenger p:listOfPassenger) {
			p.setTicketId(ticket);
		}
		ticket.setListOfPassenger(listOfPassenger);
		ticketRepository.save(ticket);
	}

	@Override
	public void decreaseTicketCounts(Train train, ArrayList<PassengerDTO> listOfPassenger) {
		logger.info("Decreasing Ticket Counts");
		int count2S = 0;
		int countSL = 0;
		int countAC = 0;
		for (PassengerDTO passenger : listOfPassenger) {
			if (passenger.getSeatPreference().equals("2S")) {
				count2S++;
			} else if (passenger.getSeatPreference().equals("SL")) {
				countSL++;
			} else {
				countAC++;
			}
		}

		Train proxyTrain = trainService.getByTrainNo(train.getTrainNo());

		if ((proxyTrain.getSeat2S() - count2S >= 0) && (proxyTrain.getSeatSL() - countSL >= 0)
				&& (proxyTrain.getSeatAC() - countAC >= 0)) {
			proxyTrain.setSeat2S(proxyTrain.getSeat2S() - count2S);
			proxyTrain.setSeatSL(proxyTrain.getSeatSL() - countSL);
			proxyTrain.setSeatAC(proxyTrain.getSeatAC() - countAC);
			trainRepository.save(proxyTrain);
		} else {
			logger.warn("Ticket Booking failed,Ticket not available for one of your seat preferences");
			throw new CommonUserException("E102",
					"No tickets Available in one of your seat preferences.Kindly check ticket availability");
		}
	}

	@Override
	public void cancelOrDeleteTicket(int ticketId, User user) {
		Optional<Ticket> optionalTicket = ticketRepository.findById(ticketId);
		if (optionalTicket.isPresent()) {
			Ticket ticket = optionalTicket.get();
			ticket.getListOfPassenger().clear();
			ticketRepository.save(ticket);
			ticketRepository.deleteById(ticketId);
		}

	}

	@Override
	public void increaseTicketCounts(int ticketId) {
		logger.info("Increasing Ticket counts....");
		Optional<Ticket> optionalTicket = ticketRepository.findById(ticketId);
		if (optionalTicket.isPresent()) {
			Ticket ticket = optionalTicket.get();
			int count2S = 0;
			int countSL = 0;
			int countAC = 0;
			for (Passenger passenger : ticket.getListOfPassenger()) {
				if (passenger.getSeatPreference().equals("2S")) {
					count2S++;
				} else if (passenger.getSeatPreference().equals("SL")) {
					countSL++;
				} else {
					countAC++;
				}
			}
			Train proxyTrain = trainService.getByTrainNo(ticket.getTrainId().getTrainNo());
			proxyTrain.setSeat2S(proxyTrain.getSeat2S() + count2S);
			proxyTrain.setSeatSL(proxyTrain.getSeatSL() + countSL);
			proxyTrain.setSeatAC(proxyTrain.getSeatAC() + countAC);
			trainRepository.save(proxyTrain);
		}

	}

	@Override
	public List<Ticket> getUserTickets(String email) {
		logger.info("Getting Tickets of User with id{}", email);
		return userService.getUserById(email).getListOfTickets();
	}

	public Ticket getByTicketId(int ticketId) {
		Optional<Ticket> optionalTicket = ticketRepository.findById(ticketId);
		if (optionalTicket.isPresent()) {
			return optionalTicket.get();
		} else {
			logger.warn("Ticket not found with Id {}", ticketId);
			return null;
		}
	}
}
