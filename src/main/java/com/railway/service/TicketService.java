package com.railway.service;


import java.util.ArrayList;
import java.util.List;

import com.railway.dto.PassengerDTO;
import com.railway.entities.Ticket;
import com.railway.entities.Train;
import com.railway.entities.User;

public interface TicketService {
	void createTicket(User user, Train train, ArrayList<PassengerDTO> listOfPassenger, int totalAmount);

	int getTotalAmount(ArrayList<PassengerDTO> listOfPassenger);

	void decreaseTicketCounts(Train train, ArrayList<PassengerDTO> listOfPassenger);

	void cancelOrDeleteTicket(int ticketId, User user);

	void increaseTicketCounts(int ticketId);

	public Ticket getByTicketId(int ticketId);

	List<Ticket> getUserTickets(String email);
}
